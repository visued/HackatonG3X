from rest_framework import serializers
from .models import User
from django.contrib import auth
from rest_framework.exceptions import AuthenticationFailed

from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.utils.encoding import smart_str, force_str, smart_bytes, DjangoUnicodeDecodeError
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode


class RegisterSerializer(serializers.ModelSerializer):
    password = serializers.CharField(max_length=68, min_length=8, write_only=True)

    class Meta:
        model = User
        fields = ['email', 'cpf', 'username', 'password']

    def validate(self, attrs):
        email = attrs.get('email', '')
        username = attrs.get('username', '')

        if not username.isalnum():
            raise serializers.ValidationError(
                    'O apelido precisa ser alfanumérico')
        
        return attrs

    def create(self, validate_data):
        return User.objects.create_user(**validate_data)

class EmailVerificationSerializer(serializers.ModelSerializer):
    token = serializers.CharField(max_length=555)

    class Meta:
        model = User
        fields = ['token'] 

class LoginSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(max_length=255, min_length=3)   
    password = serializers.CharField(max_length=68, min_length=6, write_only=True) 
    username = serializers.CharField(max_length=255, min_length=3, read_only=True)
    tokens = serializers.CharField(max_length=68, min_length=6, read_only=True) 

    class Meta:
        model = User
        fields = ['email', 'password', 'username', 'tokens']
    def validate(self, attrs):
        email = attrs.get('email', '')  
        password = attrs.get('password', '')

        user = auth.authenticate(email=email, password=password)
        if not user:
            raise AuthenticationFailed('Credencias inválidas, tente novamente.')
        if not user.is_active:
            raise AuthenticationFailed('Sua conta está desabilitada, entre em contato com suporte.')
        if not user.is_verified:
            raise AuthenticationFailed('Email não está verificado.')

        return {
            'email': user.email,
            'username': user.username,
            'tokens': user.tokens
        }
        return super().validate(attrs)

class ResetPasswordEmailRequestSerializer(serializers.Serializer):
    email = serializers.EmailField(min_length=2)

    class Meta:
        field = ['email']

class SetNewPasswordSerializer(serializers.Serializer):
    password = serializers.CharField(min_length=6, max_length=68, write_only=True)
    token = serializers.CharField(min_length=1, write_only=True)
    uidb64 = serializers.CharField(min_length=1, write_only=True)

    class Meta:
        fields = ['password', 'token', 'uidb64']
    
    def validate(self, attrs):
        try:
            password = attrs.get('password')
            token = attrs.get('token')
            uidb64 = attrs.get('uidb64')
            id = force_str(urlsafe_base64_decode(uidb64))
            user = User.objects.get(id=id)

            if not PasswordResetTokenGenerator().check_token(user, token):
                raise AuthenticationFailed('Este link de restar senha está inválido', 401)

            user.set_password(password)
            user.save()
        except Exception as e:
            raise AuthenticationFailed('Este link de restar senha está inválido', 401)
        return super().validate(attrs)
