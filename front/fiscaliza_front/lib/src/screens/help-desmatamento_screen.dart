import 'package:flutter/material.dart';

class HelpDesmatamentoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Desmatamento')),
        body: ListView(
          children: [
            Container(
                height: 220,
                child: Image.asset('assets/images/desmatamento.jpg',
                    fit: BoxFit.fill)),
            Divider(),
            Container(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'O desmatamento é um dos mais graves problemas ambientais do nosso tempo. \n \n Além de devastar as florestas e os recursos naturais, ele compromete o equilíbrio do planeta em seus diversos elementos, incluindo os ecossistemas, afetando gravemente também a economia e a sociedade.',
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
