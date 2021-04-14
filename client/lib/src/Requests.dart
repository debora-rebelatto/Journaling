import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:journal_app/src/API.dart';
import 'package:journal_app/src/Controllers/PortController.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class Requests {
  static Future buildHost() async {
    try {
      return await PortController.getHostPort();
    } catch(event) {
      return APIURL.url;
    }
  }

  static Future<Map<String, String>> buildHeader() async {
    var pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer ${token ?? ''}',
    };
  }

  static Future httpGET(String url) async {
    final response = await http.get(await buildHost() + url, headers: await buildHeader());
    return jsonDecode(response.body);
  }

  static Future httpPOST(String url, { dynamic body }) async => body != null
    ? await http.post(await buildHost() + url, headers: await buildHeader(), body: body)
    : await http.post(await buildHost() + url, headers: await buildHeader());


  static Future httpPUT(String url, { dynamic body }) async {
    var response = await http.put(await buildHost() + url, headers: await buildHeader(), body: body);
    return response.statusCode;
  }

  static Future httpDELETE(String url) async{
    var response = await http.delete(await buildHost() + url, headers: await buildHeader());
    return response.statusCode;
  }
}