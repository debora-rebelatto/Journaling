import 'package:flutter/material.dart';

class WidgetNotes extends StatefulWidget {
  final notes;

  WidgetNotes(this.notes);

  _WidgetState createState() => _WidgetState();
}

class _WidgetState extends State<WidgetNotes> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder (
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: widget.notes.length,
          itemBuilder: (context, index) {
            var note = widget.notes[index];
            return Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children:[
                    Container(
                      height: 50, width: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(int.parse('0xff' + note['color'])),
                      ),
                    ),
                    Column(children:[
                      Container(
                        padding: EdgeInsets.only(left: 10, bottom: 5),
                        child: Text('10 am', style: TextStyle(fontSize: 18, color: Color(0xffa6a7b9)))
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(note['name'], style: TextStyle(fontSize: 18))
                      )
                    ])
                  ]),
                  Icon(Icons.arrow_forward_ios)
              ])
            );
          }
        );
  }
}