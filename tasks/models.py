from django.db import models


class Task(models.Model):
    title = models.CharField(max_length=50)
    description = models.TextField(blank=True, null=True)
    duration = models.CharField(max_length=50)
    created = models.DateTimeField(auto_now_add=True,)
    completed = models.BooleanField(default=False)

    def __str__(self):
        """Return a string representation of the Task object."""
        return self.title
