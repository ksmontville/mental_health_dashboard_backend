from django.http import HttpResponse, JsonResponse
from authlib.integrations.django_oauth2 import ResourceProtector
from backend import validator

require_auth = ResourceProtector()
validator = validator.Auth0JWTBearerTokenValidator(
    "django-rest-api.us.auth0.com",
    "https://django-rest-api"
)
require_auth.register_token_validator(validator)


def not_protected(request):
    response_dict = {'response': 'Any user may request this data.'}
    return JsonResponse(data=response_dict)


def protected(request):
    response_dict = {'response': 'Users who are logged in may request this data.'}
    return JsonResponse(data=response_dict)


@require_auth(None)
def protected_with_auth(request):
    response_dict = {'response': 'Users must be logged in and have correct authorization to request this data.'}
    return JsonResponse(data=response_dict)
