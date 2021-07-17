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
          ListView(
            children: [
              Stack(
                children: [
                  Container(
                      height: 170.0,
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/logo.jpg',
                        height: 150,
                      )),
                ],
              ),
              Divider(),
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
                  )),
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
