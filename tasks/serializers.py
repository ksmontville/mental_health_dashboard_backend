from rest_framework import serializers
from .models import Task


class TaskSerializer(serializers.HyperlinkedModelSerializer):
    """Returns a JSON of the desired Task."""
    class Meta:
        model = Task
        fields = ['id', 'title', 'description', 'duration', 'created', 'completed']

