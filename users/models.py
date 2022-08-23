from django.db import models


class User(models.Model):
    """
    A class for retrieving a users' id from the Auth0 management API
    https://django-rest-api.us.auth0.com/api/v2/
    """
    user_id = models.CharField(max_length=100)
    display_name = models.CharField(max_length=50)
    email = models.CharField(max_length=50)

    def __str__(self):
        """Returns a string representation of the User."""
        return self.display_name

