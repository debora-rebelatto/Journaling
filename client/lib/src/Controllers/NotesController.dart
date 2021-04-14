import 'package:journal_app/src/Requests.dart';

class NotesControllers {
  static getNote() async => await Requests.httpGET('/notes');
  static getNoteByNotebookId(id) async => await Requests.httpGET('/notes/notebook/60773289b7787f37f4d1b0e2');
}
