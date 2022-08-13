from rest_framework import serializers
from .models import Task


class TaskSerializer(serializers.ModelSerializer):
    """Returns a JSON of the desired Task."""
    class Meta:
        model = Task
        fields = ['id', 'owner', 'title', 'description', 'duration', 'created', 'completed', 'date_completed']

