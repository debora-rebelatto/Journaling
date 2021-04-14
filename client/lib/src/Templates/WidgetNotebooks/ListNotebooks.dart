import 'package:flutter/material.dart';
import 'package:journal_app/src/Templates/WidgetNotebooks/journal.dart';

class ListNotebooks extends StatefulWidget {
  final List<dynamic> notebooks;

  ListNotebooks(this.notebooks);

  @override
  _ListNotebooksState createState() => _ListNotebooksState();
}

class _ListNotebooksState extends State<ListNotebooks> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        itemCount: widget.notebooks.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          var notebooks = widget.notebooks[index];
          var padding = index == 0
            ? EdgeInsets.only(left: 25, right: 10) : EdgeInsets.only(left: 10, right: 10);
          return Container(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                journal(notebooks['color']),
                Container(
                  height: 50,
                  padding: EdgeInsets.only(top: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(notebooks['name'], style: TextStyle(color: Color(0xff373348), fontWeight: FontWeight.bold, fontSize: 20),)
                )
              ]
            )
          );
        }
      )
    );
  }
}