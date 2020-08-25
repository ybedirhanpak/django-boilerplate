from django.db import models


class BaseModel(models.Model):
    is_active = models.BooleanField(default=True)
    created_date = models.DateTimeField(auto_now_add=True)
    modified_date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return "{}-{}".format(type(self).__name__, self.id)

    class Meta:
        abstract = True
