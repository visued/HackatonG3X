import 'package:flutter/material.dart';

class HelpMausTratosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Maus tratos de animais')),
        body: ListView(
          children: [
            Container(
                height: 220,
                child: Image.asset('assets/images/maus_tratos.jpg',
                    fit: BoxFit.fill)),
            Divider(),
            Container(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Os maus tratos aos animais representam todo ato que venha ferir a dignidade física e moral do animal, além de limitar a sua liberdade. \n \n Atos de violência, entre outros, são praticados com a finalidade única de causar dor, sofrimento e até morte ao animal. São inúmeras as maneiras de maltratar os animais.',
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
