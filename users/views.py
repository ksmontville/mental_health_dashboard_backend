from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from authlib.integrations.django_oauth2 import ResourceProtector
from backend import validator
from .models import User
from .seralizers import UserSerializer
import requests as r

require_auth = ResourceProtector()
validator = validator.Auth0JWTBearerTokenValidator(
    "django-rest-api.us.auth0.com",
    "https://django-rest-api"
)
require_auth.register_token_validator(validator)


@csrf_exempt
def management(request):
    # Request access token to Management API (24 hours)
    management_url = 'https://django-rest-api.us.auth0.com/api/v2'

    request_token_url = 'https://django-rest-api.us.auth0.com/oauth/token'
    headers = {'content-type': 'application/json'}
    payload = '{"client_id":"YQnrMDwuUxul4E6YmQtvWHgS283lMN4Y",' \
              '"client_secret":"fX-FO7C77Vs5sGC9WjA2WmMjZIoeaALWD0xc9gFuofsjXtRf90xfZKDP7BfC9dg_",' \
              f'"audience":"{management_url}/",' \
              '"grant_type":"client_credentials"}'

    response = r.post(url=request_token_url, headers=headers, data=payload)

    data = response.json()
    token = response.json()['access_token']

    headers = {
        'Authorization': f'Bearer {token}',
        'contentType': 'application/json'
    }

    if request.method == 'GET':
        response = r.get(url=f'{management_url}/users', headers=headers)
        data = response.json()
        return JsonResponse(data, status=201, safe=False)

    elif request.method == 'PATCH':
        user_data = JSONParser().parse(request)
        user_id = user_data["user_metadata[user_id]"]
        response = r.patch(url=f'{management_url}/users/{user_id}', headers=headers, data=user_data)
        data = response.json()
        return JsonResponse(data, status=201, safe=False)

