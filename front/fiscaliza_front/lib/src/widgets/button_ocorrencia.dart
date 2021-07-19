import 'package:fiscaliza_front/src/screens/ocorrencia_screen.dart';
import 'package:flutter/material.dart';
//import 'package:loja_virtual/screens/cart_screen.dart';

class ButtonOcorrencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => OcorrenciaScreen()));
      },
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
