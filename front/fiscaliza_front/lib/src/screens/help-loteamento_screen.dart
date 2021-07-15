import 'package:flutter/material.dart';

class HelpLoteamentoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Loteamento Irregular')),
        body: ListView(
          children: [
            Container(
                height: 220,
                child: Image.asset('assets/images/loteamento.jpg',
                    fit: BoxFit.fill)),
            Divider(),
            Container(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Loteamento irregular é aquele que possui algum tipo de registro no município. O responsável pode ter feito uma consulta prévia ou ter dado entrada com parte da documentação, mas não chegou a aprovar o projeto.',
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
