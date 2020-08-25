from rest_framework import serializers
from rest_auth.registration.serializers import RegisterSerializer
from .models import User


class UserRegisterSerializer(RegisterSerializer):
    full_name = serializers.CharField(required=False, max_length=255)
    age = serializers.IntegerField(required=False)
    weight = serializers.CharField(required=False)
    bio = serializers.CharField(required=False)

    def save(self, request):
        user = super().save(request)
        user.full_name = request.data.get('full_name', '')
        user.age = request.data.get('age', None)
        user.weight = request.data.get('weight', None)
        user.bio = request.data.get('bio', '')
        user.save()
        return user


class UserDetailsSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'password', 'full_name', 'age',
                  'weight', 'bio', 'is_visible', 'is_staff', 'is_superuser')
        extra_kwargs = {'password': {'write_only': True}}
