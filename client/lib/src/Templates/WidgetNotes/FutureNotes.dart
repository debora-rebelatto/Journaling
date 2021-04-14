import 'package:flutter/material.dart';
import 'package:journal_app/src/Controllers/NotesController.dart';

import 'WidgetNotes.dart';

class FutureNotes extends StatefulWidget {
  @override
  _FutureNotesState createState() => _FutureNotesState();
}

class _FutureNotesState extends State<FutureNotes> {
  Future<dynamic> _future;

  @override
  void initState() {
    super.initState();
    _future = _getData();
  }

  _getData() async => await NotesControllers.getNote();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return Center(child: CircularProgressIndicator()); break;
          case ConnectionState.done: default: return snapshot.hasError
            ? Center(child: Text(snapshot.error)) : WidgetNotes(snapshot.data);
        }
      },
    );
  }
}