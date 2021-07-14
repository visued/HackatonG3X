# Create your models here.
from django.contrib.auth.models import (
    AbstractBaseUser, BaseUserManager, PermissionsMixin
)

from django.db import models
from rest_framework_simplejwt.tokens import RefreshToken
from cpf_field.models import CPFField

class UserManager(BaseUserManager):
    
    def create_user(self, username, email, cpf, password):        
        if username is None:
            raise TypeError('Usuários precisam de um apelido')
        if password is None:
            raise TypeError('Usuários precisam de um apelido')        
        if email is None:
            raise TypeError('Usuários precisam de um email válido')

        user = self.model(username=username, email=self.normalize_email(email), cpf=cpf)
        user.set_password(password)
        user.save()
        return user        

    def create_superuser(self, username, email, password = None):
        if password is None:
            raise TypeError('Senha não pode ser vazia')
        
        user = self.create_user(username, email, password)
        user.is_superuser = True
        user.is_staff = True
        user.save()     
        return user   

class User(AbstractBaseUser, PermissionsMixin):    
    username = models.CharField(max_length=255, unique=True, db_index=True)
    email = models.EmailField(max_length=255, unique=True, db_index=True)
    is_verified = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    is_staff = models.BooleanField(default=False)
    long_name = models.CharField(max_length=255, blank=True, )
    cpf = CPFField('cpf', unique=True, db_index=True)
    phone = models.CharField(max_length=20)


    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']

    objects = UserManager()

    def __str__(self):
        return self.email
    
    def tokens(self):
        refresh = RefreshToken.for_user(self)
        return {
            'refresh': str(refresh),
            'access': str(refresh.access_token)
        }


