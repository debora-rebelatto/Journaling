
import 'package:flutter/material.dart';
import 'package:journal_app/src/Controllers/LoginController.dart';
import 'package:journal_app/src/Templates/HostConfig/HostConfig.dart';
import 'package:journal_app/src/Templates/Login/Login.dart';
import 'package:journal_app/src/Templates/Signup/Signup.dart';

import 'Tabs.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool isLoginTab = true;

  @override
  void initState() {
    super.initState();
  }

  void changeTab(int activeTabNum) {
    setState(() {
      isLoginTab = !isLoginTab;
    });
  }

  @override
  Widget build(BuildContext context) {
    LoginController.checkTokenValidity(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HostPorta()));
                  },
                ),
                SizedBox(height: 20),
                Container(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: Tabs(press: (value) { changeTab(value); })
                ),
                SizedBox(height: 20),
                isLoginTab ? Login() : Signup(),
              ]
            ),
          )
        )
      )
    );
  }
}