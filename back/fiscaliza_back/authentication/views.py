from django.shortcuts import render
from rest_framework import generics, status, views
from .serializers import RegisterSerializer, EmailVerificationSerializer, LoginSerializer, ResetPasswordEmailRequestSerializer, SetNewPasswordSerializer
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken
from .models import User
from .utils import Util
from django.contrib.sites.shortcuts import get_current_site
from django.urls import reverse
import jwt
from django.conf import settings
from drf_yasg.utils import swagger_auto_schema
from drf_yasg import openapi
from common.renderers import UserRenderer

from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.utils.encoding import smart_str, force_str, smart_bytes, DjangoUnicodeDecodeError
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from django.contrib.sites.shortcuts import get_current_site
from django.urls import reverse
from .utils import Util

# Create your views here.

class RegisterView(generics.GenericAPIView):
    serializer_class = RegisterSerializer
    renderer_classes = (UserRenderer,)
    def post(self, request):
        user = request.data
        serializer = self.serializer_class(data=user)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        user_data = serializer.data
        user = User.objects.get(email=user_data['email'])
        token = RefreshToken.for_user(user).access_token
        current_site = get_current_site(request).domain
        relativeLink = reverse('email-verify')        
        absurl = 'http://'+current_site+relativeLink+"?token="+str(token)
        email_body = 'Olá, '+ user.username+ ' use o link a seguir para verificar sua conta: \n' + absurl
        data = {'email_body': email_body, 'to_email': user.email, 'email_subject': 'Verifique seu e-mail'}
        Util.send_email(data)
        return Response(user_data, status=status.HTTP_201_CREATED)

class VerifyEmail(views.APIView):
    serializer_class = EmailVerificationSerializer
    renderer_classes = (UserRenderer,)
    token_param_config = openapi.Parameter('token', in_=openapi.IN_QUERY, description='Description', type=openapi.TYPE_STRING)
    @swagger_auto_schema(manual_parameters=[token_param_config])
    def get(self, request):
        token = request.GET.get('token')
        try:
            payload = jwt.decode(token, settings.SECRET_KEY, algorithms=['HS256'])
            user = User.objects.get(id=payload['user_id'])
            if not user.is_vefied:
                user.is_vefied = True
                user.save()
                return Response({'email': 'Email ativado com sucesso!'}, status=status.HTTP_200_OK)
        except jwt.ExpiredSignatureError as identifier:
            return Response({'error': 'Ativação experida'}, status=status.HTTP_400_BAD_REQUEST)
        except jwt.exceptions.DecodeError() as identifier:
            return Response({'error': 'Token inválido'}, status=status.HTTP_400_BAD_REQUEST) 

class LoginAPIView(generics.GenericAPIView):
    serializer_class = LoginSerializer
    renderer_classes = (UserRenderer,)
    def post(self, request):        
        serializer = self.serializer_class(data = request.data)
        serializer.is_valid(raise_exception=True)

        return  Response(serializer.data, status=status.HTTP_200_OK)

class RequestPasswordResetEmail(generics.GenericAPIView):
    serializer_class = ResetPasswordEmailRequestSerializer
    def post(self, request):
        serializer = self.serializer_class(data=request.data)

        email = request.data['email']
        if User.objects.filter(email=email).exists():
            user = User.objects.get(email=email)
            uidb64 = urlsafe_base64_encode(smart_bytes(user.id))
            token = PasswordResetTokenGenerator().make_token(user)
            current_site = get_current_site(request=request).domain
            relativeLink = reverse('password-reset', kwargs={'uidb64': uidb64, 'token': token})        
            absurl = 'http://'+current_site + relativeLink
            email_body = 'Olá,\n'+ user.username+ ' use o link a seguir para resetar sua senha: \n' + absurl
            data = {'email_body': email_body, 'to_email': user.email, 'email_subject': 'Resetar sua senha'}

            Util.send_email(data)
        return Response({'sucesso': 'Nós enviamos um link no seu e-mail, siga as instruções para resetar sua senha.'}, status=status.HTTP_200_OK)

class PasswordTokenCheckAPI(generics.GenericAPIView):
    @swagger_auto_schema(auto_schema=None)
    def get(self, request, uidb64, token):        
        try:
            id = smart_str(urlsafe_base64_decode(uidb64))
            user = User.objects.get(id=id)
            if not PasswordResetTokenGenerator().check_token(user, token):
                return Response({'erro': 'Token não é valido, por favor requisite outro'}, status=status.HTTP_401_UNAUTHORIZED)

            return Response({'sucesso': True, 'mensagem': 'Credenciais validadas', 'uidb64': uidb64, 'token': token}, status=status.HTTP_200_OK)

        except DjangoUnicodeDecodeError as identifier:
            return Response({'erro': 'Token não é valido, por favor requisite outro'}, status=status.HTTP_401_UNAUTHORIZED)


class SetNewPasswordAPIView(generics.GenericAPIView):
    serializer_class = SetNewPasswordSerializer

    def patch(self, request):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        return Response({'sucesso': True, 'mensagem': 'Password resetado com sucesso'}, status=status.HTTP_200_OK)