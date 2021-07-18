import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final int? id;
  final String? categorias;
  final String? andamento;
  //Localizacao localizacao;
  final String? nomeLogradouro;
  final String? numero;
  final String? bairro;
  final String? descricao;
  final String? pontoReferencia;
  final String? observacoes;
  //bool infratorIdentificado;
  final String? loteamentoArea;
  final String? loteamentoProprietario;
  final String? loteamentoContato;
  final String? imagem1;
  //dynamic imagem2;
  //dynamic imagem3;
  //dynamic imagem4;
  //dynamic imagem5;
  //dynamic imagem6;

  DetailsScreen(
      this.id,
      this.categorias,
      this.andamento,
      this.nomeLogradouro,
      this.numero,
      this.bairro,
      this.descricao,
      this.pontoReferencia,
      this.observacoes,
      this.loteamentoArea,
      this.loteamentoProprietario,
      this.loteamentoContato,
      this.imagem1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detalhes'),
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: ListView(padding: EdgeInsets.all(7.0), children: [
            Text(
              "Número da Ocorrência:",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
                enabled: false,
                decoration: InputDecoration(labelText: id.toString())),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "Categoria:",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
                enabled: false,
                decoration: InputDecoration(labelText: categorias)),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "Status:",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
                enabled: false,
                decoration: InputDecoration(labelText: andamento)),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "Descrição:",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                enabled: false,
                decoration: InputDecoration(labelText: descricao)),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "Nome logradouro:",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
                enabled: false,
                decoration: InputDecoration(labelText: nomeLogradouro)),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "Número:",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
                enabled: false, decoration: InputDecoration(labelText: numero)),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "Bairro:",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
                enabled: false, decoration: InputDecoration(labelText: bairro)),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "Ponto de referência:",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
                enabled: false,
                decoration: InputDecoration(labelText: pontoReferencia)),
            SizedBox(
              height: 16.0,
            ),
            Text(
              "Observações:",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                enabled: false,
                decoration: InputDecoration(labelText: observacoes)),
            SizedBox(
              height: 16.0,
            ),
            Visibility(
                visible: categorias == 'loteamento_irregular' ? true : false,
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(right: 180.0),
                    child: Text(
                      "Nome do proprietário:",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: loteamentoProprietario,
                      )),
                  SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 133.0),
                    child: Text(
                      "Área da Propriedade em m²:",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: loteamentoArea,
                      )),
                  SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 170.0),
                    child: Text(
                      "Contato do proprietário",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: loteamentoContato,
                      )),
                  SizedBox(
                    height: 16.0,
                  )
                ])),
          ]))
        ]));
  }
}
