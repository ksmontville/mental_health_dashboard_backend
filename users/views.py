import requests as r
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from authlib.integrations.django_oauth2 import ResourceProtector
from backend import validator
from backend.settings import APP_DOMAIN, APP_URL, MANAGEMENT_URL, REQUEST_TOKEN_URL, PAYLOAD

require_auth = ResourceProtector()
validator = validator.Auth0JWTBearerTokenValidator(
    f"{APP_DOMAIN}",
    f"{APP_URL}"
)
require_auth.register_token_validator(validator)


@csrf_exempt
def management(request):
    # Request access token to Management API (24 hours lifetime)
    headers = {'content-type': 'application/json'}
    payload = PAYLOAD

    response = r.post(url=REQUEST_TOKEN_URL, headers=headers, data=payload)

    token = response.json()['access_token']

    headers = {
        'Authorization': f'Bearer {token}',
        'contentType': 'application/json'
    }

    # Use access token to GET or POST to the Auth0 Management API
    if request.method == 'GET':
        response = r.get(url=f'{MANAGEMENT_URL}/users', headers=headers)
        data = response.json()
        return JsonResponse(data, status=201, safe=False)

    elif request.method == 'PATCH':
        user_data = JSONParser().parse(request)
        user_id = user_data["user_metadata[user_id]"]
        response = r.patch(url=f'{MANAGEMENT_URL}/users/{user_id}', headers=headers, data=user_data)
        data = response.json()
        return JsonResponse(data, status=201, safe=False)

