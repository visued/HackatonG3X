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
          primarySwatch: Colors.green,
          primaryColor: Color(0xff020435),
          highlightColor: Color(0xff0EB028),
          fontFamily: 'RobotoRegular'),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
