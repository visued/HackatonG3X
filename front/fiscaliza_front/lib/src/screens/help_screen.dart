import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  HelpScreen(this.title, this.description, this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView(
          children: [
            Container(
                height: 220,
                child: Image.asset('assets/images/' + image, fit: BoxFit.fill)),
            Divider(),
            Container(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  description,
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
