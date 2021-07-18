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
            TextButton(
              child: Padding(
                  padding: EdgeInsets.only(left: 130),
                  child: Text(
                    'Porque precisamos dos dados?',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 14,
                        decoration: TextDecoration.underline),
                  )),
              onPressed: () {
                showAlertDialog(context);
              },
            ),
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

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Porque precisamos dos dados?"),
      content: Text(
          "Por conta da nova Lei Geral de Proteção de Dados (Lei 13.709/2018) ou LGPD, que tem como objetivo reforçar a responsabilidade e a transparência no tratamento dos seus dados pessoais (nome completo, endereço, CPF, email, número de whatsapp), gostaríamos de pedir o seu consentimento para armazená-los e utilizá-los com toda segurança e privacidade. \n \nAo criar o seu cadastro você está concordando com os termos citados acima."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
