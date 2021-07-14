from django.contrib import admin
from .models import Ocorrencia
from leaflet.admin import LeafletGeoAdmin

# Register your models here.

class OcorrenciaAdmin(LeafletGeoAdmin):
    list_display = ['categorias']
class OcorrenciasAdmin(admin.ModelAdmin):
    list_display = ['criado', 'categorias', 'user', 'andamento']
    list_filter = ('categorias', 'criado', 'andamento', 'nome_logradouro')
    readonly_fields = ('categorias',   
                    'nome_logradouro',  
                    'numero',  
                    'bairro',  
                    'descricao',  
                    'ponto_referencia',  
                    'observacoes',  
                    'infrator_identificado',  
                    'loteamento_area',  
                    'loteamento_proprietario',  
                    'loteamento_contato',)
admin.site.register(Ocorrencia, OcorrenciasAdmin)
