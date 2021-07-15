import 'package:fiscaliza_front/src/screens/help-abandono_screen.dart';
import 'package:fiscaliza_front/src/screens/help-areapublica_screen.dart';
import 'package:fiscaliza_front/src/screens/help-descarte_screen.dart';
import 'package:fiscaliza_front/src/screens/help-desmatamento_screen.dart';
import 'package:fiscaliza_front/src/screens/help-loteamento_screen.dart';
import 'package:fiscaliza_front/src/screens/help-maustratos_screen.dart';
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HelpDescarteScreen()));
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
                    builder: (context) => HelpDesmatamentoScreen()));
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
                    builder: (context) => HelpLoteamentoScreen()));
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
                    builder: (context) => HelpAreaPublicaScreen()));
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
                    builder: (context) => HelpMausTratosScreen()));
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
                    builder: (context) => HelpAbandonoScreen()));
              },
            ),
          ],
        )));
  }
}
