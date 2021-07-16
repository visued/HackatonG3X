import 'package:fiscaliza_front/src/screens/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(title: Text('Novo Cadastro')),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView(padding: EdgeInsets.all(7.0), children: [
            TextFormField(
                decoration: InputDecoration(
              hintText: 'Nome Completo',
              border: new OutlineInputBorder(
                  borderSide:
                      new BorderSide(color: Theme.of(context).accentColor)),
              prefixIcon: Icon(Icons.account_box, color: Colors.white),
            )),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(hintText: 'CPF'),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Celular'),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'E-mail'),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Senha'),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Confirme sua senha'),
            ),
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
