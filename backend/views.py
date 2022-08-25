from authlib.integrations.django_oauth2 import ResourceProtector
from django.http import JsonResponse
from . import validator

require_auth = ResourceProtector()
validator = validator.Auth0JWTBearerTokenValidator(
    "django-rest-api.us.auth0.com",
    "https://django-rest-api",

)
require_auth.register_token_validator(validator)

