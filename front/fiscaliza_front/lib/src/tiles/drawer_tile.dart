import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  final int page;
  DrawerTile(this.icon, this.text, this.controller, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
            controller.jumpToPage(page);
          },
          child: Container(
              color: Theme.of(context).highlightColor,
              margin: EdgeInsets.only(bottom: 3),
              height: 60.0,
              child: Row(
                children: [
                  Icon(icon,
                      size: 32.0,
                      color: controller.page?.round() == page
                          ? Theme.of(context).primaryColor
                          : Colors.white),
                  SizedBox(width: 32.0),
                  Text(text,
                      style: TextStyle(
                        color: controller.page?.round() == page
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                        fontSize: 16.0,
                      ))
                ],
              ))),
    );
  }
}
