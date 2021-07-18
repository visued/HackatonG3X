import 'package:fiscaliza_front/src/tiles/map_tile.dart';
import 'package:flutter/material.dart';

import 'endereco_infrator_screen.dart';

class EnderecoOcorrenciaScreen extends StatefulWidget {
  @override
  _EnderecoOcorrenciaScreenState createState() =>
      _EnderecoOcorrenciaScreenState();
}

class _EnderecoOcorrenciaScreenState extends State<EnderecoOcorrenciaScreen> {
  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    print("Focus: " + _focus.hasFocus.toString());
  }

  FocusNode _focus = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Endereço da ocorrência')),
      body: Column(
        children: <Widget>[
          Flexible(
              flex: 1, child: Container(color: Colors.blue, child: MapTile())),
          Flexible(
              flex: 1,
              child: ListView(padding: EdgeInsets.all(7.0), children: [
                Divider(),
                TextFormField(
                  focusNode: _focus,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Nome do logradouro é obrigatório';
                    }
                  },
                  decoration: InputDecoration(hintText: '* Nome do logradouro'),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Nome do logradouro é obrigatório';
                    }
                  },
                  decoration: InputDecoration(hintText: 'Número'),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Bairro é obrigatório';
                    }
                  },
                  decoration: InputDecoration(hintText: 'Bairro'),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Ponto de referência é obrigatório';
                    }
                  },
                  decoration: InputDecoration(hintText: 'Ponto de referência'),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Ponto de referência é obrigatório';
                      }
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: 'Observações',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))))),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: ElevatedButton.icon(
                        icon: Text('INDENTIFICAR O INFRATOR'),
                        label: Icon(Icons.save, size: 16),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor)),
                        onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EnderecoInfratorScreen()))
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
