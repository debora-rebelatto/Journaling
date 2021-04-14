import 'package:flutter/material.dart';
import 'package:journal_app/src/Templates/Home/Home.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SharedPrefController.dart';

class LoginController {
  static dynamic checkTokenValidity(context) async {
    var pref = await SharedPreferences.getInstance();

    var token = pref.getString('token');

    if(JwtDecoder.isExpired(token) || token == null) {
      await SharedPrefController.removeUser();
    } else {
      await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return Home();
        })
      );
    }
  }
}