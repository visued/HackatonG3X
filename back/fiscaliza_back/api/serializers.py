from rest_framework import serializers
from fiscalizaMapa.models import Ocorrencia

from rest_framework_gis.serializers import GeoFeatureModelSerializer
from drf_extra_fields.fields import Base64ImageField

class OcorrenciaSerializer(serializers.ModelSerializer):
    imagem_1 = Base64ImageField(required=False, max_length=None, use_url=True)
    imagem_2 = Base64ImageField(required=False, max_length=None, use_url=True)
    imagem_3 = Base64ImageField(required=False, max_length=None, use_url=True)
    imagem_4 = Base64ImageField(required=False, max_length=None, use_url=True)
    imagem_5 = Base64ImageField(required=False, max_length=None, use_url=True)
    imagem_6 = Base64ImageField(required=False, max_length=None, use_url=True)
    class Meta:
        model = Ocorrencia
        fields = ('user', 'categorias', 'localizacao', 'nome_logradouro', 'numero', 'bairro', 'descricao', 'ponto_referencia', 'observacoes', 'infrator_identificado', 'loteamento_area', 'loteamento_proprietario', 'loteamento_contato', 'imagem_1', 'imagem_2', 'imagem_3', 'imagem_4', 'imagem_5', 'imagem_6')

class LocationGeoSerializer(GeoFeatureModelSerializer):
    class Meta:
        model = Ocorrencia
        geo_field = 'localizacao'
        imagem_1 = serializers.SerializerMethodField('get_url_imagem')
        imagem_2 = serializers.SerializerMethodField('get_url_imagem')
        imagem_3 = serializers.SerializerMethodField('get_url_imagem')
        imagem_4 = serializers.SerializerMethodField('get_url_imagem')
        imagem_5 = serializers.SerializerMethodField('get_url_imagem')
        imagem_6 = serializers.SerializerMethodField('get_url_imagem')
        fields = ('user', 'categorias', 'localizacao', 'nome_logradouro', 'numero', 'bairro', 'descricao', 'ponto_referencia', 'observacoes', 'infrator_identificado', 'loteamento_area', 'loteamento_proprietario', 'loteamento_contato', 'imagem_1', 'imagem_2', 'imagem_3', 'imagem_4', 'imagem_5', 'imagem_6')
    def get_url_imagem(self, obj):
        return self.context['request'].build_absolute_uri(obj.imagem)


class OcorrenciasByUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ocorrencia
        fields = ('user', 'categorias', 'localizacao', 'nome_logradouro', 'numero', 'bairro', 'descricao', 'ponto_referencia', 'observacoes', 'infrator_identificado', 'loteamento_area', 'loteamento_proprietario', 'loteamento_contato', 'imagem_1', 'imagem_2', 'imagem_3', 'imagem_4', 'imagem_5', 'imagem_6')
