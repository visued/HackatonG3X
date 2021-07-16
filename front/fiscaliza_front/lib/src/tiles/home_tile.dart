import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {
  final IconData icon;
  final String name;
  HomeTile(this.icon, this.name);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: () {
            /*  Navigator.of(context).pop();
            controller.jumpToPage(page); */
          },
          child: Card(
              child: Row(
            children: [
              Icon(
                icon,
                size: 32.0,
                /* color: controller.page?.round() == page
                          ? Theme.of(context).primaryColor
                          : Colors.grey[700] */
              ),
              SizedBox(width: 32.0),
              Text(name,
                  style: TextStyle(
                      /* color: controller.page?.round() == page
                            ? Theme.of(context).primaryColor
                            : Colors.grey[700],
                        fontSize: 16.0, */
                      ))
            ],
          ))),
    );
  }
}
