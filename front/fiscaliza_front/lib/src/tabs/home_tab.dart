import 'package:fiscaliza_front/src/models/ocorrencia.dart';
import 'package:fiscaliza_front/src/services/ocorrencias.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  OcorrenciasService ocorrencias = OcorrenciasService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildContainer());
  }

  buildContainer() {
    return Container(
        child: StreamBuilder(
      stream: getFutureOcorrencias().asStream(),
      builder: (BuildContext context, AsyncSnapshot<Ocorrencia> snapshot) {
        if (snapshot.data!.data.isNotEmpty) {
          return ListView.builder(
            padding: EdgeInsets.all(7.0),
            itemCount: snapshot.data!.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shadowColor: Colors.black,
                child: Container(
                  width: 300,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      if (snapshot.data!.data[index].categorias == 'descarte')
                        cardOcorrencia(snapshot.data!.data[index]),
                      if (snapshot.data!.data[index].categorias ==
                          'desmatamento')
                        cardOcorrencia(snapshot.data!.data[index]),
                      if (snapshot.data!.data[index].categorias ==
                          'loteamento_irregular')
                        cardOcorrencia(snapshot.data!.data[index]),
                      if (snapshot.data!.data[index].categorias ==
                          'uso_area_publica')
                        cardOcorrencia(snapshot.data!.data[index]),
                      if (snapshot.data!.data[index].categorias ==
                          'maltrato_animais')
                        cardOcorrencia(snapshot.data!.data[index]),
                      if (snapshot.data!.data[index].categorias ==
                          'abandono_animais')
                        cardOcorrencia(snapshot.data!.data[index]),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Text(
              'Você ainda não possui ocorrências regitradas, toque no botão (+) para inserir uma nova.');
        }
      },
    ));
  }

  cardOcorrencia(snapshot) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Color(0xffFFA000),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (snapshot.andamento == 'andamento_01')
                Text(
                  'Registro do número da Ocorrência',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              if (snapshot.andamento == 'andamento_02')
                Text(
                  'Registro do Auto de Infração - AI',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              if (snapshot.andamento == 'andamento_03')
                Text(
                  'Encaminhamento do AI à 2ª. Promotoria de Justiça',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              if (snapshot.andamento == 'andamento_04')
                Text(
                  'Encaminhamento do AI à 7ª. Promotoria de Justiça',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              if (snapshot.andamento == 'andamento_05')
                Text(
                  'Encaminhamento do AI à Polícia Civil',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              if (snapshot.andamento == 'andamento_06')
                Text(
                  'Encaminhamento do AI à Polícia Militar Ambiental',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              if (snapshot.andamento == 'andamento_8')
                Text(
                  'Encaminhamento do AI à CETESB',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              if (snapshot.andamento == 'andamento_9') Text('Não Procede'),
              if (snapshot.andamento == '')
                Text(
                  'Andamento não disponível.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 14,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Nº da ocorrência: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                          text: '${snapshot.id}',
                          style: TextStyle(fontWeight: FontWeight.normal)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                if (snapshot.categorias == 'descarte')
                  RichText(
                    text: TextSpan(
                      text: 'Tipo da ocorrência: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      children: [
                        TextSpan(
                            text: 'Descarte Irregular',
                            style: TextStyle(fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                if (snapshot.categorias == 'desmatamento')
                  RichText(
                    text: TextSpan(
                      text: 'Tipo da ocorrência: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      children: [
                        TextSpan(
                            text: 'Desmatamento',
                            style: TextStyle(fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                if (snapshot.categorias == 'loteamento_irregular')
                  RichText(
                    text: TextSpan(
                      text: 'Tipo da ocorrência: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      children: [
                        TextSpan(
                            text: 'Loteamento Irregular',
                            style: TextStyle(fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                if (snapshot.categorias == 'maltrato_animais')
                  RichText(
                    text: TextSpan(
                      text: 'Tipo da ocorrência: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      children: [
                        TextSpan(
                            text: 'Maltrato de Animais',
                            style: TextStyle(fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                if (snapshot.categorias == 'abandono_animais')
                  RichText(
                    text: TextSpan(
                      text: 'Tipo da ocorrência: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      children: [
                        TextSpan(
                            text: 'Abandono de Animais',
                            style: TextStyle(fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                SizedBox(
                  height: 14,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Número do Auto: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    children: [
                      TextSpan(
                          text: '${snapshot.numero}',
                          style: TextStyle(fontWeight: FontWeight.normal)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Future<Ocorrencia> getFutureOcorrencias() async => await ocorrencias.get();
}
