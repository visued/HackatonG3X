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
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 203, 236, 241), Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
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
              DrawerTile(Icons.logout, "Sair", pageController, 2),
            ],
          )
        ],
      ),
    );
  }
}
