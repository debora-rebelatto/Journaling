import 'package:flutter/material.dart';
import 'package:journal_app/src/Controllers/NotebooksController.dart';
import 'package:journal_app/src/Controllers/NotesController.dart';
import 'package:journal_app/src/Templates/WidgetNotebooks/ListNotebooks.dart';
import 'package:journal_app/src/Templates/WidgetNotes/WidgetNotes.dart';

class WidgetNotebooks extends StatefulWidget { _NotebookState createState() => _NotebookState(); }

class _NotebookState extends State<WidgetNotebooks>{
  Future<dynamic> _futureNotebooks;
  var _futureNotes;
  var id;

  @override
  void initState() {
    super.initState();
    _futureNotebooks = _getData();
    _futureNotes = _getNotes();
  }

  _getData() async => await NotebooksController.getNotebook();
  _getNotes() async => await NotesControllers.getNoteByNotebookId(id);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: _futureNotebooks,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting: return Center(child: CircularProgressIndicator()); break;
              case ConnectionState.done:
              default:
              if( snapshot.hasError) {
                return Center(child: Text(snapshot.error));
              } else {
                return ListNotebooks(snapshot.data, id);
              }
            }
          },
        ),

        

        FutureBuilder(
          future: _futureNotes,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting: return Center(child: CircularProgressIndicator()); break;
              case ConnectionState.done:
              default:
              if(snapshot.hasError) {
                return Center(child: Text(snapshot.error));
              } else {
                print(snapshot.data.length);
                return WidgetNotes(snapshot.data);
              }
            }
          },
        ),
      ]
    );
  }
}
