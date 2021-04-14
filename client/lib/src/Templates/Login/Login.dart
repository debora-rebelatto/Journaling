import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:journal_app/src/Controllers/SharedPrefController.dart';
import 'package:journal_app/src/Services/AuthServices.dart';
import 'package:journal_app/src/Templates/Components/Validators.dart';
import 'package:journal_app/src/Templates/Home/Home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController(text: '');
  TextEditingController _password = TextEditingController(text: '');
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  String error = '';
  var waiting = false;

  void _toggle() { setState(() { _obscureText = !_obscureText; }); }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      alignment: Alignment.center,
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(error),

                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: 'Email'
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    validator: (value) => FieldValidator.validateIfEmpty(value)
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    obscureText: _obscureText,
                    keyboardType: TextInputType.emailAddress,
                    controller: _password,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      suffixIcon: IconButton(
                        icon: Icon( _obscureText ? Icons.visibility : Icons.visibility_off ),
                        onPressed: _toggle,
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    validator: (value) => FieldValidator.validateIfEmpty(value)
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  constraints: BoxConstraints(maxWidth: 300),
                  child: FlatButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(40) ),
                    child: waiting != false
                      ? Center(child: SizedBox(height: 20.0, width: 20.0, child: CircularProgressIndicator()))
                      : Text( 'Entrar', style: TextStyle( color: Colors.black87 ) ),
                    onPressed: waiting == true ? null : pressedLogin
                  ),
                )
              ],
            ),

        )
      )
    );
  }

  dynamic pressedLogin() async {
    if (_formKey.currentState.validate()) {
      setState(() { waiting = true; });

      var response = await AuthServices.login(_email.text, _password.text);

      setState(() { waiting = false; });

      if(response.statusCode == 200 ) {
        SharedPrefController.saveInfo(response);
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Home()));
      } else {
        setState(() { error = jsonDecode(response.body)['error'] ?? ''; });
      }
    }
  }
}