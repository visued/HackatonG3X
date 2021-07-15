import 'package:flutter/material.dart';

class OcorrenciaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Nova ocorrência')),
        body: ListView(
          padding: EdgeInsets.all(7.0),
          children: [
            Container(
              color: Colors.blue,
              height: 350,
            ),
            Divider(),
            TextFormField(
              decoration: InputDecoration(hintText: 'Categoria'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(hintText: 'Título'),
            )
          ],
        ));
  }
}
