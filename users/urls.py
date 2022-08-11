from django.urls import path
from . import views

app_name = 'users'

urlpatterns = [
    path('users/not-protected/', views.not_protected),
    path('users/protected/', views.protected),
    path('users/protected-with-auth/', views.protected_with_auth),
]
