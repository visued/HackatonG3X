import 'package:fiscaliza_front/src/screens/securitycode_resetpass_screen.dart';
import 'package:fiscaliza_front/src/services/ocorrencias.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  int statusCode = 0;
  bool _validate = false;
  String _messageFieldEmail = '';
  final _emailController = TextEditingController();
  OcorrenciasService ocorrenciasService = OcorrenciasService();
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
                'Por favor, confirme o seu e-mail.',
                style: TextStyle(color: Colors.black, fontSize: 23),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                  'Enviaremos um código para seu e-mail, para resetar sua senha insira na tela a seguir.',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
            ),
            SizedBox(
              height: 32.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _emailController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 14, 176, 40), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 67, 224, 93), width: 2.0),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'E-mail',
                  hintText: 'abc@gmail.com',
                  hintStyle: TextStyle(color: Colors.black),
                  errorText: _validate ? _messageFieldEmail : null,
                  prefixIcon: Icon(Icons.email, color: Colors.black),
                ),
              ),
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
                  setState(() {
                    if (!_emailController.text.isEmpty) {
                      _validate = true;
                    } else {
                      _messageFieldEmail = 'Digite um e-mail válido.';
                      _validate = false;
                    }
                    _emailController.text.isEmpty
                        ? _validate = true
                        : _validate = false;
                  });

                  if (!_validate) {
                    await ocorrenciasService
                        .resetPassword(_emailController.text);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => SecurityCodeResetPassScreen()));
                  }
                },
                child: Text(
                  'ENVIAR',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        )));
  }
}
