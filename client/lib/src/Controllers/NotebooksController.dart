import 'dart:convert';
import 'package:journal_app/src/Requests.dart';

class NotebooksController {

  static getNotebook() async => await Requests.httpGET('/notebooks');

  static postNotebook(name, color) async =>
    await Requests.httpPOST('/notebooks', body: jsonEncode({ "name": name, "color": color }));

}
