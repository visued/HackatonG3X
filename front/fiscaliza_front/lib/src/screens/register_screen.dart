import 'package:fiscaliza_front/src/screens/login_screen.dart';
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
            Row(
              children: [
                Expanded(
                    child: Container(
                  child: ElevatedButton.icon(
                    icon: Text('CADASTRAR'),
                    label: Icon(Icons.save, size: 16),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor)),
                    onPressed: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()))
                    },
                  ),
                ))
              ],
            )
          ])),
        ],
      ),
    );
  }
}
