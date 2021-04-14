import 'package:shared_preferences/shared_preferences.dart';

import '../API.dart';

class PortController {
  static updateHostPort({ String url }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(url != null) pref.setString("url", url);
  }

  static getHostPort() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("url") == null ? APIURL.url : pref.getString("url");
  }
}
