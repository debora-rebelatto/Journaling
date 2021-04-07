import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:journal_app/src/Controllers/PortController.dart';
import 'package:journal_app/src/Models/NotebooksModel/Notebooks.dart';

class NotebooksController {
  static buildHeader() async {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
    };
  }

  static Future<List<Notebooks>> getNotebook() async {
    print(await PortController.getHostPort());
    var response = await http.get(await PortController.getHostPort() + '/notebooks');
    print(response.body);
    //var response = await http.get('http://192.168.15.26:3000/notebooks');
    var k = jsonDecode(response.body);
    var parsed = k.cast<Map<String, dynamic>>();
    return parsed.map<Notebooks> ((json) => Notebooks.fromJson(json)).toList();
  }

  static postNotebook() async {
    var response = await http.post(await PortController.getHostPort() + '/notebooks',
      headers: await buildHeader(),
      body: jsonEncode({ "name": "name1", "color": "EE1D6A" })
    );
    return response;
  }
}
