from django.contrib.gis.db import models
from authentication.models import User

from django.db.models import Manager

# Create your models here.
CATEGORIAS = (
    ('descarte', 'Descarte irregular de residuos'),
    ('desmatamento', 'Desmatamento'),
    ('loteamento_irregular', 'Loteamento irregular'),
    ('uso_area_publica', 'Uso indevido de área pública'),
    ('maltrato_animais', 'Maltrato de animais'),
    ('abandono_animais', 'Abandono de animais'),
)

ANDAMENTO = (
    ('descarte', 'Registro do auto de infração - AI'),
    ('desmatamento', 'Encaminhamento do AI à 2ª. Promotoria de Justiça'),
    ('loteamento_irregular', 'Encaminhamento do AI à 7ª. Promotoria de Justiça'),
    ('uso_area_publica', 'Encaminhamento do AI à Polícia Civil'),
    ('maltrato_animais', 'Encaminhamento do AI à Polícia Militar Ambiental'),
    ('abandono_animais', 'Encaminhamento do AI à CETESB'),
)
class Ocorrencia(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    criado = models.DateTimeField(auto_now=True)
    categorias = models.CharField(max_length=255, choices=CATEGORIAS)
    andamento = models.CharField(max_length=255, choices=ANDAMENTO, blank=True) #editavel para o guarda
    localizacao = models.PointField(srid=4326)
    nome_logradouro = models.CharField(max_length=240)
    numero = models.CharField(max_length=240, blank=True)
    bairro = models.CharField(max_length=240)
    descricao = models.CharField(max_length=240)
    ponto_referencia = models.CharField(max_length=240, blank=True)
    observacoes = models.CharField(max_length=240, blank=True)
    infrator_identificado = models.BooleanField(blank=True)
    loteamento_area = models.CharField(max_length=240, blank=True)
    loteamento_proprietario = models.CharField(max_length=240, blank=True)
    loteamento_contato = models.CharField(max_length=240, blank=True)
    numero_auto = models.CharField(max_length=240, blank=True) # editavel para o guarda
    imagem_1 = models.ImageField(upload_to='media/', max_length=254)
    imagem_2 = models.ImageField(upload_to='media/', max_length=254, blank=True)
    imagem_3 = models.ImageField(upload_to='media/', max_length=254, blank=True)
    imagem_4 = models.ImageField(upload_to='media/', max_length=254, blank=True)
    imagem_5 = models.ImageField(upload_to='media/', max_length=254, blank=True)
    imagem_6 = models.ImageField(upload_to='media/', max_length=254, blank=True)



    objects = Manager()

    def __str__(self):
        return self.categorias







