import 'package:fiscaliza_front/src/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter's Clothing",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color.fromARGB(255, 14, 0, 70),
          fontFamily: 'RobotoRegular'),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
