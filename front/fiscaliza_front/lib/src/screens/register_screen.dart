import 'package:fiscaliza_front/src/screens/securitycode_register_screen.dart';
import 'package:fiscaliza_front/src/services/ocorrencias.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _messageFieldEmail = '';
  String _messageFieldCPF = '';
  String _messageFieldPhone = '';
  String _messageFieldName = '';
  String _messageFieldPass = '';
  String _messageFieldConfirmPass = '';
  bool _validate = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureTextCheck = true;
  bool pressed = true;
  String? _password;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cpfController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();

  var confirmPass;
  OcorrenciasService ocorrenciasService = OcorrenciasService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Novo cadastro')),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 16.0,
          ),
          Expanded(
              child: ListView(padding: EdgeInsets.all(7.0), children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)),
                hintText: 'Nome Completo',
                prefixIcon: Icon(Icons.account_box),
                errorText: _validate ? _messageFieldName : null,
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _cpfController,
              decoration: InputDecoration(
                errorText: _validate ? _messageFieldCPF : null,
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)),
                hintText: 'CPF',
                prefixIcon: Icon(Icons.assignment_ind),
              ),
              validator: (text) {
                if (text!.isEmpty) {
                  return 'CPF ?? obrigat??rio';
                }
              },
              keyboardType: TextInputType.phone,
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)),
                hintText: 'Celular',
                errorText: _validate ? _messageFieldPhone : null,
                prefixIcon: Icon(Icons.local_phone),
              ),
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Celular ?? obrigat??rio';
                }
              },
              keyboardType: TextInputType.phone,
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)),
                hintText: 'E-mail',
                prefixIcon: Icon(Icons.markunread),
                errorText: _validate ? _messageFieldEmail : null,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 16.0,
            ),
            new TextFormField(
                controller: _passwordController,
                key: _formKey,
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: 'Senha',
                    prefixIcon: Icon(Icons.lock),
                    errorText: _validate ? _messageFieldPass : null,
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
                    errorText: _validate ? _messageFieldConfirmPass : null,
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
                onSaved: (val) => _password = val,
                obscureText: _obscureTextCheck),
            TextButton(
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Por que precisamos dos dados?',
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
                    child: Text('Criar meu cadastro',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff0EB028))),
                    onPressed: () async {
                      setState(() {
                        if (!_emailController.text.isEmpty) {
                          _validate = true;
                        } else {
                          _messageFieldEmail = 'Digite um e-mail v??lido.';
                          _messageFieldCPF = 'Digite um CPF v??lido.';
                          _messageFieldPhone = 'Digite um celular v??lido.';
                          _messageFieldName = 'Digite um nome v??lido.';
                          _messageFieldPass = 'Digite uma senha v??lida.';
                          _messageFieldConfirmPass = 'Digite uma senha v??lida.';
                          _validate = false;
                        }
                        _emailController.text.isEmpty
                            ? _validate = true
                            : _validate = false;
                      });

                      if (!_validate) {
                        await ocorrenciasService.register(
                          _emailController.text,
                          _cpfController.text,
                          _phoneController.text,
                          _nameController.text,
                          _passwordController.text,
                        );

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SecurityCodeRegisterScreen()));
                      }
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
      title: Text("Por que precisamos dos dados?"),
      content: Text(
          "Por conta da nova Lei Geral de Prote????o de Dados (Lei 13.709/2018) ou LGPD, que tem como objetivo refor??ar a responsabilidade e a transpar??ncia no tratamento dos seus dados pessoais (nome completo, endere??o, CPF, email, n??mero de whatsapp), gostar??amos de pedir o seu consentimento para armazen??-los e utiliz??-los com toda seguran??a e privacidade. \n \nAo criar o seu cadastro voc?? est?? concordando com os termos citados acima."),
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
