import 'package:journal_app/src/Requests.dart';


class NotesControllers {
  static getNote() async {
    print('lkasjdlksadj');
    var response = await Requests.httpGET('/notes');

print(response);
    // await http.get(await PortController.getHostPort() + '/notes');
    // var response = await http.get('http://192.168.15.26:3000/notes');
    // var k = jsonDecode(response.body);
    // var parsed = k.cast<Map<String, dynamic>>();
    // return parsed.map<Notes> ((json) => Notes.fromJson(json)).toList();
    return response;
  }
}
