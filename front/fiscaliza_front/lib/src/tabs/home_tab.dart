import 'package:fiscaliza_front/src/models/ocorrencia.dart';
import 'package:fiscaliza_front/src/screens/details_screen.dart';
import 'package:fiscaliza_front/src/services/ocorrencias.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jiffy/jiffy.dart';

class HomeTab extends StatelessWidget {
  OcorrenciasService ocorrencias = OcorrenciasService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildContainer());
  }

  buildContainer() {
    final storage = FlutterSecureStorage();
    return Container(
        child: Column(
      children: [
        Flexible(
            child: StreamBuilder(
          stream: getFutureOcorrencias().asStream(),
          builder: (BuildContext context, AsyncSnapshot<Ocorrencia> snapshot) {
            if (snapshot.data?.data.isNotEmpty ?? false) {
              return ListView.builder(
                padding: EdgeInsets.all(7.0),
                itemCount: snapshot.data?.data.length ?? 0,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    child: Card(
                      shadowColor: Colors.black,
                      child: Container(
                        width: 300,
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            if (snapshot.data?.data[index].categorias ==
                                'descarte')
                              cardOcorrencia(snapshot.data?.data[index]),
                            if (snapshot.data?.data[index].categorias ==
                                'desmatamento')
                              cardOcorrencia(snapshot.data?.data[index]),
                            if (snapshot.data?.data[index].categorias ==
                                'loteamento_irregular')
                              cardOcorrencia(snapshot.data?.data[index]),
                            if (snapshot.data?.data[index].categorias ==
                                'uso_area_publica')
                              cardOcorrencia(snapshot.data?.data[index]),
                            if (snapshot.data?.data[index].categorias ==
                                'maltrato_animais')
                              cardOcorrencia(snapshot.data?.data[index]),
                            if (snapshot.data?.data[index].categorias ==
                                'abandono_animais')
                              cardOcorrencia(snapshot.data?.data[index]),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                  snapshot.data?.data[index].id,
                                  snapshot.data?.data[index].categorias,
                                  snapshot.data?.data[index].andamento,
                                  snapshot.data?.data[index].nomeLogradouro,
                                  snapshot.data?.data[index].numero,
                                  snapshot.data?.data[index].bairro,
                                  snapshot.data?.data[index].descricao,
                                  snapshot.data?.data[index].pontoReferencia,
                                  snapshot.data?.data[index].observacoes,
                                  snapshot.data?.data[index].loteamentoArea,
                                  snapshot
                                      .data?.data[index].loteamentoProprietario,
                                  snapshot.data?.data[index].loteamentoContato,
                                  //snapshot.data?.data[index].imagem1,
                                )),
                      );
                    },
                  );
                },
              );
            } else {
              return Text(
                  'Voc?? ainda n??o possui ocorr??ncias registradas, toque no bot??o (+) para inserir uma nova.');
            }
          },
        ))
      ],
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
                  'Registro do n??mero da Ocorr??ncia',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold),
                ),
              if (snapshot.andamento == 'andamento_02')
                Text(
                  'Registro do Auto de Infra????o - AI',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold),
                ),
              if (snapshot.andamento == 'andamento_03')
                Text(
                  'Encaminhamento do AI ?? 2??. Promotoria de Justi??a',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold),
                ),
              if (snapshot.andamento == 'andamento_04')
                Text(
                  'Encaminhamento do AI ?? 7??. Promotoria de Justi??a',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold),
                ),
              if (snapshot.andamento == 'andamento_05')
                Text(
                  'Encaminhamento do AI ?? Pol??cia Civil',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold),
                ),
              if (snapshot.andamento == 'andamento_06')
                Text(
                  'Encaminhamento do AI ?? Pol??cia Militar Ambiental',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold),
                ),
              if (snapshot.andamento == 'andamento_07')
                Text(
                  'Encaminhamento do AI ?? CETESB',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold),
                ),
              if (snapshot.andamento == 'andamento_09') Text('N??o Procede'),
              if (snapshot.andamento == '')
                Text(
                  'Andamento n??o dispon??vel.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.5,
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
                    text: 'N?? da ocorr??ncia: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                          text:
                              '${snapshot.id}/${Jiffy(snapshot.criado).format("yyyy")}',
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
                      text: 'Tipo da ocorr??ncia: ',
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
                      text: 'Tipo da ocorr??ncia: ',
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
                      text: 'Tipo da ocorr??ncia: ',
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
                      text: 'Tipo da ocorr??ncia: ',
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
                      text: 'Tipo da ocorr??ncia: ',
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
                    text: 'N??mero do Auto: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    children: [
                      TextSpan(
                          text:
                              '${snapshot.numero_auto == "" ? 'N??o dispon??vel' : snapshot.numero_auto}',
                          style: TextStyle(fontWeight: FontWeight.normal)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Criado em: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    children: [
                      TextSpan(
                          text:
                              '${Jiffy(snapshot.criado).format("dd-MM-yyyy HH:mm:ss")}',
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
