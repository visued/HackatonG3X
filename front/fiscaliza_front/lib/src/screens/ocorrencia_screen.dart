import 'package:fiscaliza_front/src/screens/camera_screen.dart';
import 'package:fiscaliza_front/src/tabs/help_tab.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'endereco_ocorrencia_screen.dart';
import 'home_screen.dart';

class OcorrenciaScreen extends StatefulWidget {
  @override
  State<OcorrenciaScreen> createState() => _OcorrenciaScreenState();
}

class _OcorrenciaScreenState extends State<OcorrenciaScreen> {
  String dropdownValue = 'Categoria';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nova ocorrência'),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()));
            },
            icon: Icon(Icons.arrow_back),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.help_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HelpTab()));
              },
            )
          ],
        ),
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
              isExpanded: true,
              value: dropdownValue,
              icon: const Icon(Icons.keyboard_arrow_down),
              iconSize: 24,
              elevation: 16,
              underline: Container(
                height: 1,
                color: Color(0xff0EB028),
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
              decoration: InputDecoration(
                hintText: 'Título',
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff0EB028))),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff0EB028))),
              ),
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
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    labelStyle: TextStyle(color: Color(0xff0EB028)))),
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
                    onPressed: () async {
                      WidgetsFlutterBinding.ensureInitialized();
                      final cameras = await availableCameras();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              CameraScreen(camera: cameras.first)));
                    },
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
