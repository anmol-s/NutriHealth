from rest_framework import serializers
from .models import Account
from .models import User

# serializers for getting/sedning data in json form

class AccountSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Account
        fields = ('id', 'username', 'password', 'email')

class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'current_weight', 'goal')