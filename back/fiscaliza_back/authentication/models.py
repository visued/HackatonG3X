# Create your models here.
from django.contrib.auth.models import (
    AbstractBaseUser, BaseUserManager, PermissionsMixin
)

from django.db import models
from rest_framework_simplejwt.tokens import RefreshToken
from cpf_field.models import CPFField

class UserManager(BaseUserManager):
    
    def create_user(self, email, cpf, numero_de_chapa, password):        
        if password is None:
            raise TypeError('Usuário precisa de uma senha')        
        if email is None:
            raise TypeError('Usuários precisam de um email válido')

        user = self.model(email=self.normalize_email(email), cpf=cpf, numero_de_chapa=numero_de_chapa, password=password)
        user.set_password(password)
        user.save()
        return user        

    def create_superuser(self, email, cpf, numero_de_chapa, password = None):
        if password is None:
            raise TypeError('Senha não pode ser vazia')
        
        user = self.create_user(email, cpf,  numero_de_chapa, password)
        user.is_superuser = True
        user.is_staff = True
        user.save()     
        return user   

class User(AbstractBaseUser, PermissionsMixin):    
    email = models.EmailField(max_length=255, unique=True, db_index=True)
    cpf = CPFField('cpf', unique=True, db_index=True)
    numero_de_chapa = models.IntegerField(unique=True, db_index=True)
    is_verified = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    is_staff = models.BooleanField(default=False)
    long_name = models.CharField(max_length=255, blank=True, )
    phone = models.CharField(max_length=20)


    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['cpf', 'numero_de_chapa']

    objects = UserManager()

    def __str__(self):
        return self.email
    
    def tokens(self):
        refresh = RefreshToken.for_user(self)
        return {
            'refresh': str(refresh),
            'access': str(refresh.access_token)
        }


