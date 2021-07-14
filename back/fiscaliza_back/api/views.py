from fiscalizaMapa.models import Ocorrencia
from authentication.models import User

from .serializers import OcorrenciaSerializer, LocationGeoSerializer, OcorrenciasByUserSerializer
from rest_framework import viewsets, generics, status
from rest_framework.response import Response
from common.renderers import UserRenderer
from common.permissions import IsOwner
from rest_framework import permissions
# Create your views here.
class OcorrenciaViewSet(viewsets.ModelViewSet):
    serializer_class = OcorrenciaSerializer
    renderer_classes = (UserRenderer,)
    queryset = Ocorrencia.objects.all()
    permission_classes = (permissions.IsAuthenticated, IsOwner,)


class LocationList(viewsets.ModelViewSet):
    serializer_class = LocationGeoSerializer
    renderer_classes = (UserRenderer,)
    model = Ocorrencia
    queryset = Ocorrencia.objects.all()
    permission_classes = (permissions.IsAuthenticated, IsOwner,)

class OcorrenciasByUserList(generics.ListAPIView):
    serializer_class = OcorrenciasByUserSerializer
    renderer_classes = (UserRenderer,)
    permission_classes = (permissions.IsAuthenticated, IsOwner,)
    
    def get(self, request, email):
        if email != None:
            user = User.objects.get(email=email)
            ocorrencia = Ocorrencia.objects.get(user=user)
            serializer = OcorrenciasByUserSerializer(ocorrencia)
        else:
            ocorrencia = Ocorrencia.objects.all()
            serializer = OcorrenciasByUserSerializer(ocorrencia)
        
        return Response(serializer.data, status=status.HTTP_200_OK)      







