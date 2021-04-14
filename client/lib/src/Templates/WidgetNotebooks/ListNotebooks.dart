import 'package:flutter/material.dart';
import 'package:journal_app/src/Templates/WidgetNotebooks/journal.dart';

// ignore: must_be_immutable
class ListNotebooks extends StatefulWidget {
  final List<dynamic> notebooks;
  var id;

  ListNotebooks(this.notebooks, this.id);

  @override
  _ListNotebooksState createState() => _ListNotebooksState();
}

class _ListNotebooksState extends State<ListNotebooks> {
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      widget.id = widget.notebooks[0]['_id'];
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
          return Material(
            color: Colors.transparent,
            child: Ink(
              child: InkWell(
                hoverColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    widget.id = notebooks['_id'];
                  });
                  // widget.press(notebooks['_id']);
                },
                child: Container(
                  color: Colors.transparent,
                  padding: padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      journal(notebooks['color']),
                      Container(
                        height: 50,
                        padding: EdgeInsets.only(top: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(notebooks['title'], style: TextStyle(color: Color(0xff373348), fontWeight: FontWeight.bold, fontSize: 20),)
                      )
                    ]
                  )
                )
              )
            )
          );
        }
      )
    );
  }
}