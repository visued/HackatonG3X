import 'package:fiscaliza_front/src/screens/securitycode_resetpass_screen.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Altere sua Senha"),
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
                style: TextStyle(color: Colors.white),
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
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.email, color: Colors.white),
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
                  /* await authentication.login(
                      emailController.text, passwordController.text); */
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => SecurityCodeResetPassScreen()));
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
