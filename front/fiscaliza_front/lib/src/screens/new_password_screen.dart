import 'package:fiscaliza_front/src/services/ocorrencias.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class NewPasswordScreen extends StatefulWidget {
  final String? code;
  NewPasswordScreen({this.code});

  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool _obscureText = true;
  bool _obscureTextCheck = true;
  String _messageFieldConfirmPass = '';
  bool _validate = false;
  bool pressed = true;
  String? _password;
  int statusCode = 0;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  OcorrenciasService ocorrenciasService = OcorrenciasService();
  final _codeController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Altere sua senha"),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Digite a sua nova senha',
                style: TextStyle(color: Colors.black, fontSize: 23),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: new TextFormField(
                  controller: _passwordController,
                  key: _formKey,
                  decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintText: 'Digite a nova senha',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                          icon: Padding(
                              padding:
                                  EdgeInsets.only(left: 4, right: 4, top: 0),
                              child: _obscureText == true
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility)),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          })),
                  onSaved: (val) => _password = val,
                  obscureText: _obscureText),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              height: 40,
              width: 300,
              decoration: BoxDecoration(
                  color: Color(0xff0EB028),
                  borderRadius: BorderRadius.circular(6)),
              child: TextButton(
                onPressed: () async {
                  await ocorrenciasService.verifyPassword(
                      this.widget.code, _passwordController.text);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LoginScreen()));
                },
                child: Text(
                  'CONFIRMAR',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        )));
  }
}
