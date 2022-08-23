from django.db import models


class Task(models.Model):
    owner = models.CharField(max_length=100)
    title = models.CharField(max_length=50)
    description = models.TextField(blank=True, null=True)
    duration = models.IntegerField()
    created = models.DateTimeField(auto_now_add=True,)
    completed = models.BooleanField(default=False)
    date_completed = models.CharField(max_length=100)

    def __str__(self):
        """Return a string representation of the Task object."""
        return self.title


class Preset(models.Model):
    """Model to describe generic preset tasks that users may choose from and call from API."""
    title = models.CharField(max_length=50)
    description = models.CharField(max_length=100)
    duration = models.IntegerField()

    def __str__(self):
        """Returns a string representation of the Preset object."""
        return self.title
