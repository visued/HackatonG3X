import 'package:fiscaliza_front/src/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

/* void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
} */

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  void _handleRememberme(bool value) {
    _rememberMe = value;
    setState(() {
      _rememberMe = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/logo.jpg')),
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            Text(
              'Seja bem vindo(a)! \n \n Faça seu login',
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 20),
            ),
            SizedBox(
              height: 32.0,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
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
                    hintText: 'abc@gmail.com'),
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
                obscureText: true,
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
                    labelText: 'Senha',
                    hintText: 'Digite sua senha'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*  Checkbox(
                    activeColor: Color(0xff00C8E8),
                    value: _rememberMe,
                    onChanged: _handleRememberme), */
                SizedBox(width: 10.0),
                TextButton(
                  onPressed: () {
                    // Salvar senha
                  },
                  child: Text(
                    'Lembrar-me',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 14),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Redirecionar para tela de reset de senha
                  },
                  child: Text(
                    'Esqueci minha senha',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 14),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(6)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomeScreen()));
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
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
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
