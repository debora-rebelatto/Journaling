import 'package:flutter/material.dart';
import 'package:journal_app/src/Controllers/NotebooksController.dart';
import 'package:journal_app/src/Models/NotebooksModel/Notebooks.dart';

import 'journal.dart';

class WidgetNotebooks extends StatefulWidget { _NotebookState createState() => _NotebookState(); }

class _NotebookState extends State<WidgetNotebooks>{
  Future<dynamic> _future;
  Future<List<dynamic>> _getData() async => NotebooksController.getNotebook();

  @override
  void initState() {
    super.initState();
    _future = _getData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 20.0), height: 240.0,
        child: Align(
          alignment: Alignment.topCenter,
          child: FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              return snapshot.hasData
              ? ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  Notebooks notebooks = snapshot.data[index];
                  print(notebooks);
                  var padding = index == 0
                    ? EdgeInsets.only(left: 25, right: 10) : EdgeInsets.only(left: 10, right: 10);
                  return Container(
                    padding: padding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        journal(notebooks.color),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(notebooks.name, style: TextStyle(color: Color(0xff373348), fontWeight: FontWeight.bold, fontSize: 20),)
                        )
                      ]
                    )
                  );
                }
              )
              : Container();
            }
          )
        )
      )
    );
  }
}
