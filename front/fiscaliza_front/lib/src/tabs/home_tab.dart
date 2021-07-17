import 'package:fiscaliza_front/src/tiles/home_tile.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(5.0),
        children: [
          HomeTile(Icons.pets, 'Maus tratos animais', 'maus tratos'),
          Divider(),
        ],
      ),
    );
  }
}
