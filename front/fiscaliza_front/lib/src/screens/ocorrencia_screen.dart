import 'package:fiscaliza_front/src/screens/camera_screen.dart';
import 'package:fiscaliza_front/src/tiles/map_tile.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'endereco_ocorrencia_screen.dart';
import 'home_screen.dart';

class OcorrenciaScreen extends StatefulWidget {
  @override
  State<OcorrenciaScreen> createState() => _OcorrenciaScreenState();
}

class _OcorrenciaScreenState extends State<OcorrenciaScreen> {
  String? pos;
  String dropdownValue = 'Categoria';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nova ocorrência'),
        ),
        body: Column(children: [
          Flexible(
              flex: 1,
              child: Container(
                  color: Colors.blue,
                  child: MapTile(
                    addLatLg: addLatLg,
                  ))),
          Text(
            "Aperte por 3s no mapa para indicar o local da ocorrência",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  icon: Text('PRÓXIMO'),
                  label: Icon(Icons.arrow_forward, size: 16),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor)),
                  onPressed: () => {
                    //print(pos),
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            EnderecoOcorrenciaScreen(latlg: pos)))
                  },
                ),
              )
            ],
          )
        ])
        // Column(children: [
        //   Expanded(
        //       child: ListView(
        //     padding: EdgeInsets.all(7.0),
        //     children: [
        //       DropdownButton<String>(
        //         isExpanded: true,
        //         value: dropdownValue,
        //         icon: const Icon(Icons.keyboard_arrow_down),
        //         iconSize: 24,
        //         elevation: 16,
        //         underline: Container(
        //           height: 1,
        //           color: Color(0xff0EB028),
        //         ),
        //         onChanged: (String? newValue) {
        //           setState(() {
        //             dropdownValue = newValue!;
        //           });
        //         },
        //         items: <String>[
        //           'Categoria',
        //           'Descarte irregular de resíduos',
        //           'Desmatamento',
        //           'Loteamento irregular',
        //           'Uso indevido de área pública ',
        //           'Maus tratos contra animais',
        //           'Abandono de animais'
        //         ].map<DropdownMenuItem<String>>((String value) {
        //           return DropdownMenuItem<String>(
        //             value: value,
        //             child: Text(value),
        //           );
        //         }).toList(),
        //       ),
        //       SizedBox(height: 16.0),
        //       Visibility(
        //           visible:
        //               dropdownValue == 'Loteamento irregular' ? true : false,
        //           child: Column(children: [
        //             TextFormField(
        //                 validator: (text) {
        //                   if (text!.isEmpty &&
        //                       dropdownValue == 'Loteamento irregular') {
        //                     return 'Nome do proprietário é obrigatório';
        //                   }
        //                 },
        //                 decoration: InputDecoration(
        //                     hintText: 'Nome do proprietário',
        //                     border: OutlineInputBorder(
        //                         borderRadius:
        //                             BorderRadius.all(Radius.circular(10.0))),
        //                     labelStyle: TextStyle(color: Color(0xff0EB028)))),
        //             SizedBox(
        //               height: 16.0,
        //             ),
        //             TextFormField(
        //                 decoration: InputDecoration(
        //                     hintText: 'Área da Propriedade em m²',
        //                     border: OutlineInputBorder(
        //                         borderRadius:
        //                             BorderRadius.all(Radius.circular(10.0))),
        //                     labelStyle: TextStyle(color: Color(0xff0EB028)))),
        //             SizedBox(
        //               height: 16.0,
        //             ),
        //             TextFormField(
        //                 validator: (text) {
        //                   if (text!.isEmpty &&
        //                       dropdownValue == 'Loteamento irregular') {
        //                     return 'Contato do proprietário é obrigatório';
        //                   }
        //                 },
        //                 decoration: InputDecoration(
        //                     hintText: 'Contato do proprietário',
        //                     border: OutlineInputBorder(
        //                         borderRadius:
        //                             BorderRadius.all(Radius.circular(10.0))),
        //                     labelStyle: TextStyle(color: Color(0xff0EB028)))),
        //             SizedBox(
        //               height: 16.0,
        //             )
        //           ])),
        //       Text(
        //         "Descrição do Ocorrência:",
        //         style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        //       ),
        //       TextFormField(
        //           validator: (text) {
        //             if (text!.isEmpty) {
        //               return 'Descrição da ocorrência é obrigatório';
        //             }
        //           },
        //           keyboardType: TextInputType.multiline,
        //           maxLines: 5,
        //           decoration: InputDecoration(
        //               hintText:
        //                   'Ex: Cachorro da raça labrador abandonado perto do posto.',
        //               border: OutlineInputBorder(
        //                   borderRadius:
        //                       BorderRadius.all(Radius.circular(10.0))),
        //               labelStyle: TextStyle(color: Color(0xff0EB028)))),
        //       SizedBox(height: 16.0),
        //       Visibility(
        //           visible: dropdownValue == 'Descarte irregular de resíduos'
        //               ? true
        //               : false,
        //           child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text(
        //                   "Descrição do Infrator:",
        //                   style: TextStyle(
        //                       fontSize: 16.0, fontWeight: FontWeight.bold),
        //                 ),
        //                 TextFormField(
        //                     keyboardType: TextInputType.multiline,
        //                     maxLines: 5,
        //                     decoration: InputDecoration(
        //                         hintText:
        //                             'Ex: placa do carro-123; celular - 99999-9999',
        //                         border: OutlineInputBorder(
        //                             borderRadius: BorderRadius.all(
        //                                 Radius.circular(10.0))),
        //                         labelStyle:
        //                             TextStyle(color: Color(0xff0EB028)))),
        //                 SizedBox(height: 16.0),
        //               ])),

        //       // Colocar um floating button (drag & drop) para o botão de câmera
        //     ],
        //   )),
        //   Container(
        //       padding: EdgeInsets.all(7.0),
        //       child: Row(
        //         children: [
        //           Expanded(
        //               child: Container(
        //             child: ElevatedButton.icon(
        //               icon: Icon(Icons.camera_alt, size: 16),
        //               label: Text('INSERIR FOTO'),
        //               style: ButtonStyle(
        //                   backgroundColor: MaterialStateProperty.all(
        //                       Theme.of(context).highlightColor)),
        //               onPressed: () async {
        //                 WidgetsFlutterBinding.ensureInitialized();
        //                 final cameras = await availableCameras();
        //                 Navigator.of(context).push(MaterialPageRoute(
        //                     builder: (context) =>
        //                         CameraScreen(camera: cameras.first)));
        //               },
        //             ),
        //           )),
        //           SizedBox(
        //             width: 30.0,
        //           ),

        //           Expanded(
        //               child: Container(
        //             child:
        //             // ElevatedButton.icon(
        //             //     icon: Text('CONCLUIR'),
        //             //     label: Icon(Icons.save, size: 16),
        //             //     style: ButtonStyle(
        //             //         backgroundColor: MaterialStateProperty.all(
        //             //             Theme.of(context).primaryColor)),
        //             //     onPressed: () => {
        //             //       showAlertDialog(context)
        //             //       // Navigator.of(context).push(MaterialPageRoute(
        //             //       //     builder: (context) => EnderecoOcorrenciaScreen()))
        //             //     },
        //             //   ),
        //             ElevatedButton.icon(
        //               icon: Text('PRÓXIMO'),
        //               label: Icon(Icons.arrow_forward, size: 16),
        //               style: ButtonStyle(
        //                   backgroundColor: MaterialStateProperty.all(
        //                       Theme.of(context).primaryColor)),
        //               onPressed: () => {
        //                 Navigator.of(context).push(MaterialPageRoute(
        //                     builder: (context) => EnderecoOcorrenciaScreen()))
        //               },
        //             ),
        //           )),
        //         ],
        //       ))
        // ])
        );
  }

  addLatLg(String pos) {
    setState(() {
      this.pos = pos;
      //print(this.pos);
    });
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("CONCLUIR"),
      onPressed: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Agradecemos o seu envio!"),
      content: Text(
          "O número da sua ocorrência é tal.\nSalientamos que informações insuficientes pode impossibilitar a apuração desta ocorrência."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
