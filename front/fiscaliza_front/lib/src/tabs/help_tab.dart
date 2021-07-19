import 'package:fiscaliza_front/src/screens/help_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(HelpTab());

class HelpTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            InkWell(
              child: Card(
                child: Stack(
                  children: <Widget>[
                    Image.asset('assets/images/descarte_irregular.jpg',
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover),
                    Container(
                      margin: EdgeInsets.only(top: 120),
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.center,
                      color: Colors.black38,
                      child: Text('Descarte irregular de resíduos',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            //fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => HelpScreen(
                          'Descarte irregular de resíduos',
                          'O resíduo destinado de maneira irregular tem a capacidade de degradar o meio ambiente e prejudicar a saúde humana. \n \nEntendemos destinação irregular de resíduos como todo aquele resíduo que não é dado um tratamento adequado ou disposição em locais legalizados e que tenha controle sobre eles.',
                          'descarte_irregular.jpg')),
                );
              },
            ),
            InkWell(
              child: Card(
                child: Stack(
                  children: <Widget>[
                    Image.asset('assets/images/desmatamento.jpg',
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover),
                    Container(
                      margin: EdgeInsets.only(top: 120),
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.center,
                      color: Colors.black38,
                      child: Text('Desmatamento',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            //fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HelpScreen(
                        'Desmatamento',
                        'O desmatamento é um dos mais graves problemas ambientais do nosso tempo. \n \n Além de devastar as florestas e os recursos naturais, ele compromete o equilíbrio do planeta em seus diversos elementos, incluindo os ecossistemas, afetando gravemente também a economia e a sociedade.',
                        'desmatamento.jpg')));
              },
            ),
            InkWell(
              child: Card(
                child: Stack(
                  children: <Widget>[
                    Image.asset('assets/images/loteamento.jpg',
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover),
                    Container(
                      margin: EdgeInsets.only(top: 120),
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.center,
                      color: Colors.black38,
                      child: Text('Loteamento irregular',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            //fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HelpScreen(
                        'Loteamento',
                        'Loteamento irregular é aquele que possui algum tipo de registro no município. O responsável pode ter feito uma consulta prévia ou ter dado entrada com parte da documentação, mas não chegou a aprovar o projeto.',
                        'loteamento.jpg')));
              },
            ),
            InkWell(
              child: Card(
                child: Stack(
                  children: <Widget>[
                    Image.asset('assets/images/area_publica.jpg',
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover),
                    Container(
                      margin: EdgeInsets.only(top: 120),
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.center,
                      color: Colors.black38,
                      child: Text('Uso indevido de área pública',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            //fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HelpScreen(
                        'Uso indevido de área pública',
                        'O uso indevido da área pública diz respeito a qualquer manipulação indevida no que pertence ao poder pública, como construções ou outras ações sem uma prévia autorização da autoridade.',
                        'area_publica.jpg')));
              },
            ),
            InkWell(
              child: Card(
                child: Stack(
                  children: <Widget>[
                    Image.asset('assets/images/maus_tratos.jpg',
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover),
                    Container(
                      margin: EdgeInsets.only(top: 120),
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.center,
                      color: Colors.black38,
                      child: Text('Maus tratos de animais',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            //fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HelpScreen(
                        'Maus tratos de animais',
                        'Os maus tratos aos animais representam todo ato que venha ferir a dignidade física e moral do animal, além de limitar a sua liberdade. \n \n Atos de violência, entre outros, são praticados com a finalidade única de causar dor, sofrimento e até morte ao animal. São inúmeras as maneiras de maltratar os animais.',
                        'maus_tratos.jpg')));
              },
            ),
            InkWell(
              child: Card(
                child: Stack(
                  children: <Widget>[
                    Image.asset('assets/images/abandono_animais.jpg',
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover),
                    Container(
                      margin: EdgeInsets.only(top: 120),
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.center,
                      color: Colors.black38,
                      child: Text('Abandono de animais',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            //fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HelpScreen(
                        'Abandono de animais',
                        'Animais não são descartáveis e abandoná-los é crime segundo a nova Lei Federal nº 14.064/20, que altera a Lei nº 9.605/1998, aumentando a pena de detenção para até cinco anos para crimes de maus-tratos a cães e gatos.\n \n O abandono causa extremo sofrimento ao animal, que tem dificuldades para encontrar alimento e abrigo em ambientes desconhecidos, ficando desprotegidos da chuva, do frio, da exposição ao tempo e sujeitos a brigas, atropelamentos e maus-tratos. Vale lembrar que, nem todos os animais são resgatados ou adotados.',
                        'abandono_animais.jpg')));
              },
            ),
          ],
        )));
  }
}
