import 'package:fiscaliza_front/src/screens/login_screen.dart';
import 'package:fiscaliza_front/src/tabs/help_tab.dart';
import 'package:fiscaliza_front/src/tabs/home_tab.dart';
import 'package:fiscaliza_front/src/widgets/button_ocorrencia.dart';
import 'package:fiscaliza_front/src/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
//import 'package:loja_virtual/tabs/home_tab.dart';
//import 'package:loja_virtual/tabs/products_tab.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text("Minhas Ocorrências"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: HomeTab(),
          floatingActionButton: ButtonOcorrencia(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Ajuda"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: HelpTab(),
        ),
        Scaffold(
          drawer: CustomDrawer(_pageController),
          body: LoginScreen(),
        ),
      ],
    );
  }
}
