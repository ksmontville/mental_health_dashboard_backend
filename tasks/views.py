from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse, JsonResponse
from rest_framework.parsers import JSONParser
from .models import Task
from .serializers import TaskSerializer
from authlib.integrations.django_oauth2 import ResourceProtector
from backend import validator

require_auth = ResourceProtector()
validator = validator.Auth0JWTBearerTokenValidator(
    "django-rest-api.us.auth0.com",
    "https://django-rest-api"
)
require_auth.register_token_validator(validator)


@require_auth(None)
@csrf_exempt
def tasks(request):
    """Return JSON of current tasks."""
    if request.method == 'GET':
        task_list = Task.objects.all()
        serializer = TaskSerializer(task_list, many=True)
        return JsonResponse(data=serializer.data, safe=False)

    elif request.method == 'POST' or request.method == 'OPTIONS':
        data = JSONParser().parse(request)
        serializer = TaskSerializer(data=data)

        if serializer.is_valid():
            serializer.save()
            return JsonResponse(data=serializer.data, status=201)

        return JsonResponse(serializer.errors, status=400,)


@require_auth(None)
@csrf_exempt
def task_detail(request, pk):
    task = Task.objects.get(pk=pk)

    if request.method == 'GET':
        serializer = TaskSerializer(task)
        return JsonResponse(data=serializer.data, safe=False)

    elif request.method == 'PUT':
        data = JSONParser().parse(request)
        serializer = TaskSerializer(task, data=data)

        if serializer.is_valid():
            serializer.save()
            return JsonResponse(data=serializer.data, status=201)

        return JsonResponse(serializer.errors, status=400)

    elif request.method == 'DELETE':
        task.delete()
        return HttpResponse(status=201)
