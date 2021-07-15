import 'package:flutter/material.dart';

class HelpAbandonoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Abandono de animais')),
        body: ListView(
          children: [
            Container(
                height: 220,
                child: Image.asset('assets/images/abandono_animais.jpg',
                    fit: BoxFit.fill)),
            Divider(),
            Container(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Animais não são descartáveis e abandoná-los é crime segundo a nova Lei Federal nº 14.064/20, que altera a Lei nº 9.605/1998, aumentando a pena de detenção para até cinco anos para crimes de maus-tratos a cães e gatos.\n \n O abandono causa extremo sofrimento ao animal, que tem dificuldades para encontrar alimento e abrigo em ambientes desconhecidos, ficando desprotegidos da chuva, do frio, da exposição ao tempo e sujeitos a brigas, atropelamentos e maus-tratos. Vale lembrar que, nem todos os animais são resgatados ou adotados.',
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
