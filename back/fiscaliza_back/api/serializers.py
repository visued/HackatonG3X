from rest_framework import serializers
from fiscalizaMapa.models import Ocorrencia

from rest_framework_gis.serializers import GeoFeatureModelSerializer

class OcorrenciaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ocorrencia
        fields = ('user', 'categorias', 'localizacao', 'nome_logradouro', 'numero', 'bairro', 'descricao', 'ponto_referencia', 'observacoes', 'infrator_identificado', 'loteamento_area', 'loteamento_proprietario', 'loteamento_contato')

class LocationGeoSerializer(GeoFeatureModelSerializer):
    class Meta:
        model = Ocorrencia
        geo_field = 'localizacao'
        fields = ('user', 'categorias', 'localizacao', 'nome_logradouro', 'numero', 'bairro', 'descricao', 'ponto_referencia', 'observacoes', 'infrator_identificado', 'loteamento_area', 'loteamento_proprietario', 'loteamento_contato')


class OcorrenciasByUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ocorrencia
        fields = ('user', 'categorias', 'localizacao', 'nome_logradouro', 'numero', 'bairro', 'descricao', 'ponto_referencia', 'observacoes', 'infrator_identificado', 'loteamento_area', 'loteamento_proprietario', 'loteamento_contato')
