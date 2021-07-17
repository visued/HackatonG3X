import 'package:fiscaliza_front/src/screens/securitycode_register_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Initially password is obscure
  bool _obscureText = true;
  bool _obscureTextCheck = true;
  bool pressed = true;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Novo Cadastro')),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 16.0,
          ),
          Expanded(
              child: ListView(padding: EdgeInsets.all(7.0), children: [
            TextFormField(
                decoration: InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal)),
              hintText: 'Nome Completo',
              prefixIcon: Icon(Icons.account_box),
            )),
            SizedBox(height: 16.0),
            TextFormField(
                decoration: InputDecoration(
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal)),
              hintText: 'CPF',
              prefixIcon: Icon(Icons.assignment_ind),
            )),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)),
                hintText: 'Celular',
                prefixIcon: Icon(Icons.local_phone),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)),
                hintText: 'E-mail',
                prefixIcon: Icon(Icons.markunread),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 16.0,
            ),
            new TextFormField(
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: 'Senha',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                        icon: Padding(
                            padding: EdgeInsets.only(left: 4, right: 4, top: 0),
                            child: _obscureText == true
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        })),
                validator: (val) =>
                    val!.length < 6 ? 'Password too short.' : null,
                onSaved: (val) => _password = val,
                obscureText: _obscureText),
            SizedBox(
              height: 16.0,
            ),
            new TextFormField(
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: 'Confirme sua senha',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                        icon: Padding(
                            padding: EdgeInsets.only(left: 4, right: 4, top: 0),
                            child: _obscureTextCheck == true
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)),
                        onPressed: () {
                          setState(() {
                            _obscureTextCheck = !_obscureTextCheck;
                          });
                        })),
                validator: (val) =>
                    val!.length < 6 ? 'Password too short.' : null,
                onSaved: (val) => _password = val,
                obscureText: _obscureTextCheck),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 300,
                  child: ElevatedButton(
                    child: Text('Criar seu cadastro',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff0EB028))),
                    onPressed: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SecurityCodeRegisterScreen()))
                    },
                  ),
                )
              ],
            )
          ])),
        ],
      ),
    );
  }
}
