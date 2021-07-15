import 'package:flutter/material.dart';

class HelpDescarteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Descarte irregular de resíduos')),
        body: ListView(
          children: [
            Container(
                height: 220,
                child: Image.asset('assets/images/descarte_irregular.jpg',
                    fit: BoxFit.fill)),
            Divider(),
            Container(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'O resíduo destinado de maneira irregular tem a capacidade de degradar o meio ambiente e prejudicar a saúde humana. \n \nEntendemos destinação irregular de resíduos como todo aquele resíduo que não é dado um tratamento adequado ou disposição em locais legalizados e que tenha controle sobre eles.',
                  style: TextStyle(
                    fontFamily: 'RobotoRegular',
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
