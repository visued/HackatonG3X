import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {
  final IconData icon;
  final String name;
  final String status;
  HomeTile(this.icon, this.name, this.status);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: () {
            /*  Navigator.of(context).pop();
            controller.jumpToPage(page); */
          },
          child: Container(
              padding: EdgeInsets.only(left: 5.0),
              height: 70.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 1.0),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 25.0,
                  ),
                  SizedBox(width: 32.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(name,
                          style: TextStyle(
                            fontSize: 20.0,
                          )),
                      Text(status,
                          style: TextStyle(
                            fontSize: 16.0,
                          ))
                    ],
                  )
                ],
              ))),
    );
  }
}
