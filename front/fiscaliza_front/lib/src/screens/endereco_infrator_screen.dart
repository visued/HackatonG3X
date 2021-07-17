import 'package:flutter/material.dart';

class EnderecoInfratorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Informações do Infrator')),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView(padding: EdgeInsets.all(7.0), children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Nome do infrator'),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Contato do infrator'),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Nome do logradouro'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(hintText: 'Número'),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Bairro'),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Ponto de referência'),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(
                    hintText: 'Observações',
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(10.0))))),
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  child: ElevatedButton.icon(
                    icon: Text('CRIAR OCORRÊNCIA'),
                    label: Icon(Icons.save, size: 16),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor)),
                    onPressed: () => {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => EnderecoOcorrenciaScreen()))
                    },
                  ),
                ))
              ],
            )
          ])),
        ],
      ),
    );
  }
}
