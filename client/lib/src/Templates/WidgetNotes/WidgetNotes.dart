import 'package:flutter/material.dart';
import 'package:journal_app/src/Controllers/NotesController.dart';
import 'package:journal_app/src/Models/NotesModel/Notes.dart';

class WidgetNotes extends StatefulWidget{ _WidgetState createState() => _WidgetState(); }

class _WidgetState extends State<WidgetNotes> {
  Future<dynamic> _future;
  Future<List<dynamic>> _getData() async => await NotesControllers.getNote();

  @override
  void initState() {
    super.initState();
    _future = _getData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        return snapshot.hasData
        ? ListView.builder (
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            Notes note = snapshot.data[index];
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
                        color: Color(int.parse('0xff' + note.color)),
                      ),
                    ),
                    Column(children:[
                      Container(
                        padding: EdgeInsets.only(left: 10, bottom: 5),
                        child: Text('10 am', style: TextStyle(fontSize: 18, color: Color(0xffa6a7b9)))
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(note.name, style: TextStyle(fontSize: 18))
                      )
                    ])
                  ]),
                  Icon(Icons.arrow_forward_ios)
              ])
            );
          }
        )
        : Container(child: Text('error'));
      }
    );
  }
}