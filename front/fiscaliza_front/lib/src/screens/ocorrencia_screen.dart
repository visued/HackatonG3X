import 'package:flutter/material.dart';

import 'endereco_ocorrencia_screen.dart';

class OcorrenciaScreen extends StatefulWidget {
  @override
  State<OcorrenciaScreen> createState() => _OcorrenciaScreenState();
}

class _OcorrenciaScreenState extends State<OcorrenciaScreen> {
  String dropdownValue = 'Categoria';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Nova ocorrência')),
        body: ListView(
          padding: EdgeInsets.all(7.0),
          children: [
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(0, 14, 0, 70),
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(0, 14, 176, 40),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                /*color: Colors.blue,*/
                height: 350),
            Divider(),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.keyboard_arrow_down),
              iconSize: 24,
              elevation: 16,
              underline: Container(
                height: 2,
                color: Colors.grey,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>[
                'Categoria',
                'Descarte irregular de resíduos',
                'Desmatamento',
                'Loteamento irregular',
                'Uso indevido de área pública ',
                'Maus tratos contra animais',
                'Abandono de animais'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(hintText: 'Título'),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(
                    hintText: 'Descrição',
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(10.0))))),
            SizedBox(height: 16.0),

            // Colocar um floating button (drag & drop) para o botão de câmera
            Row(
              children: [
                Expanded(
                    child: Container(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.camera_alt, size: 16),
                    label: Text('INSERIR FOTO'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: () => {},
                  ),
                )),
                SizedBox(
                  width: 30.0,
                ),
                Expanded(
                    child: Container(
                  child: ElevatedButton.icon(
                    icon: Text('PRÓXIMO'),
                    label: Icon(Icons.arrow_forward, size: 16),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor)),
                    onPressed: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EnderecoOcorrenciaScreen()))
                    },
                  ),
                )),
              ],
            )
          ],
        ));
  }
}
