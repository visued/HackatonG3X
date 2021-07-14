from django.urls import path
from .views import OcorrenciasByUserList

urlpatterns = [
    path('api/v1/user/<email>/', OcorrenciasByUserList.as_view(), name = 'denuncias_by_user'),
]