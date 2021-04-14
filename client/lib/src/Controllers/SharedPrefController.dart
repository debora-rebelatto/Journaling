import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  static saveInfo(response) async {
    var decode = jsonDecode(response.body);
    var pref = await SharedPreferences.getInstance();

    await pref.setString('token', decode['token']);
    await pref.setString('userId', decode['user']['_id']);
  }

  static dynamic removeUser() async {
    var pref = await SharedPreferences.getInstance();

    await pref.remove('id');
    await pref.remove('token');
  }
}