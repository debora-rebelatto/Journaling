import 'package:flutter/material.dart';
import 'package:journal_app/src/Controllers/NotebooksController.dart';
import 'package:journal_app/src/Templates/WidgetNotebooks/ListNotebooks.dart';

class WidgetNotebooks extends StatefulWidget { _NotebookState createState() => _NotebookState(); }

class _NotebookState extends State<WidgetNotebooks>{
  Future<dynamic> _future;

  @override
  void initState() {
    super.initState();
    _future = _getData();
  }

  _getData() async => await NotebooksController.getNotebook();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return Center(child: CircularProgressIndicator()); break;
          case ConnectionState.done: default: return snapshot.hasError
            ? Center(child: Text(snapshot.error)) : ListNotebooks(snapshot.data);
        }
      },
    );
  }
}
