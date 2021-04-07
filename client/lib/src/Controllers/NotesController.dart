import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:journal_app/src/Models/NotesModel/Notes.dart';

import 'PortController.dart';

class NotesControllers {
  static Future<List<Notes>> getNote() async {
    var response = await http.get(await PortController.getHostPort() + '/notes');
    // var response = await http.get('http://192.168.15.26:3000/notes');
    var k = jsonDecode(response.body);
    var parsed = k.cast<Map<String, dynamic>>();
    return parsed.map<Notes> ((json) => Notes.fromJson(json)).toList();
  }
}
