import 'package:flutter/material.dart';

class HelpAreaPublicaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Uso indevido de área pública')),
        body: ListView(
          children: [
            Container(
                height: 220,
                child: Image.asset('assets/images/area_publica.jpg',
                    fit: BoxFit.fill)),
            Divider(),
            Container(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'O uso indevido da área pública diz respeito a qualquer manipulação indevida no que pertence ao poder pública, como construções ou outras ações sem uma prévia autorização da autoridade.',
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
