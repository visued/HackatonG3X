import 'package:fiscaliza_front/src/screens/register_screen.dart';
import 'package:fiscaliza_front/src/screens/resetpassword_screen.dart';
import 'package:fiscaliza_front/src/services/authentication.dart';
//import 'package:fiscaliza_front/src/services/authentication.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  bool _rememberMe = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int statusCode = 0;
  bool _validate = false;
  String _messageFieldEmail = '';
  Authentication authentication = new Authentication();
  void _handleRememberme(bool? value) {
    _rememberMe = value!;

    setState(() {
      _rememberMe = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset('assets/images/logo.jpg')),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Olá, bem vindo(a) de volta!',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Insira seus dados para acessar a plataforma.',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 14, 176, 40), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 2.0),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'E-mail',
                  hintText: 'Digite seu e-mail',
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.email, color: Colors.white),
                  hoverColor: Colors.white,
                  errorText: _validate ? _messageFieldEmail : null,
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordController,
                obscureText: _obscureText,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 14, 176, 40), width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 2.0),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                  hintText: 'Digite sua senha',
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                      icon: Padding(
                          padding: EdgeInsets.only(left: 4, right: 4, top: 0),
                          child: _obscureText == true
                              ? Icon(Icons.visibility_off, color: Colors.white)
                              : Icon(Icons.visibility, color: Colors.white)),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      }),
                  errorText: _validate ? 'Campo obrigatório' : null,
                ),
              ),
            ),
            statusCode == 401
                ? Text(
                    'Usuário ou senha inválidos!',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  )
                : statusCode == 400
                    ? Text(
                        'Requisição inválida',
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      )
                    : Text(''),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  side: BorderSide(color: Color(0xff0EB028)),
                  activeColor: Color(0xff0EB028),
                  value: _rememberMe,
                  onChanged: _handleRememberme,
                ),
                TextButton(
                  onPressed: () {
                    // Salvar senha
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Text(
                      'Lembrar-me',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ResetPasswordScreen()));
                  },
                  child: Text(
                    'Esqueci minha senha',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
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
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(emailController.text);
                    if (emailValid && !emailController.text.isEmpty) {
                      _validate = true;
                    } else {
                      if (!emailValid) {
                        _messageFieldEmail = 'Digite um e-mail válido.';
                      }
                      _validate = false;
                    }
                    passwordController.text.isEmpty
                        ? _validate = true
                        : _validate = false;
                  });
                  if (!_validate) {
                    var logon = await authentication.login(
                        emailController.text, passwordController.text);
                    if (logon.isNotEmpty) {
                      if (logon[0] == true && logon[1] == 200) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomeScreen()));
                      } else if (logon[0] == false && logon[1] == 401) {
                        setState(() {
                          statusCode = logon[1];
                        });
                      }
                    }
                  }
                },
                child: Text(
                  'ENTRAR',
                  style: TextStyle(color: Colors.white, fontSize: 20),
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => RegisterScreen()));
                },
                child: Text(
                  'CADASTRAR',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
