import 'package:fiscaliza_front/src/screens/home_screen.dart';
import 'package:fiscaliza_front/src/screens/login_screen.dart';
import 'package:fiscaliza_front/src/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';
/* import 'package:loja_virtual/models/user_model.dart';
import 'package:loja_virtual/screens/login_screen.dart';
import 'package:loja_virtual/tiles/drawer_tile.dart';
import 'package:scoped_model/scoped_model.dart'; */

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        );
    return Drawer(
      child: Stack(
        children: [
          _buildDrawerBack(),
          Column(
            children: [
              Stack(
                children: [
                  Container(
                      height: 170.0,
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/logo.jpg',
                        height: 80,
                      )),
                ],
              ),
              Divider(),
              Expanded(child: Container(child: Column(children: [
              DrawerTile(Icons.home, "Início", pageController, 0),
              DrawerTile(Icons.help, "Ajuda", pageController, 1),
              Container(
                  color: Theme.of(context).highlightColor,
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 3),
                    minLeadingWidth: 44,
                    leading:
                        Icon(Icons.logout, size: 32.0, color: Colors.white),
                    title: Text('Sair',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          //fontWeight: FontWeight.bold,
                        )),
                    onTap: () {
                      showAlertDialog(context);
                    },
                  )),]))),
              Container(
                  // height: 550.0,
                  margin: EdgeInsets.only(bottom: 20.0),
                  padding: EdgeInsets.only(left: 27),
                  // alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [                    
                    Image.asset(
                      'assets/images/FACEF.png',
                      height: 30,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Image.asset(
                      'assets/images/MPSP.png',
                      height: 25,
                    ),
                  ])),
            ],
          )
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget sairButton = TextButton(
      child: Text("SAIR"),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LoginScreen()));
      },
    );
    Widget continuaButton = TextButton(
      child: Text("CONTINUAR"),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      },
    );

    //configura o AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Sair"),
      content: Text("Deseja realmente sair?"),
      actions: [
        sairButton,
        continuaButton,
      ],
    );

    //exibe o diálogo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
