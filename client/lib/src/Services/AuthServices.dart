import 'dart:convert';

import '../Requests.dart';

class AuthServices {
  static signup(_name, _email, _password) async {
    return await Requests.httpPOST('/auth/register', body: jsonEncode({
      "name": _name,
      "email": _email,
      "password": _password,
    }));
  }

  static login(_email, _password) async {
    return await Requests.httpPOST('/auth/authenticate', body: jsonEncode({
      "email": _email,
      "password": _password
    }));
  }
}