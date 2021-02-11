from django.db import models

# Create your models here.
class Account(models.Model):
    username = models.CharField(max_length=50)
    password = models.CharField(max_length=50)
    email = models.CharField(max_length=255)

class User(models.Model):
    username = models.CharField(max_length=50)
    current_weight = models.DecimalField(decimal_places=1)
    GOALS = (
        ('LW', 'Lose Weight'),
        ('MW', 'Maintain Weight'),
        ('GW', 'Gain Weight'),
        ('GM', 'Gain Muscle'),
    )
    goal = models.CharField(max_length=2, choices=GOALS)
