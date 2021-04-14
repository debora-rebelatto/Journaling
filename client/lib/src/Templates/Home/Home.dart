import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:journal_app/src/Templates/Home/IDK.dart';
import 'package:journal_app/src/Templates/HostConfig/HostConfig.dart';
import 'package:journal_app/src/Templates/WidgetNotebooks/WidgetNotebooks.dart';
import 'package:journal_app/src/Templates/WidgetNotes/FutureNotes.dart';
import '../Create.dart';
import 'Search.dart';

class Home extends StatefulWidget{
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeef2),
      body: Container(
        // padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Search(),
              StuffIdk(),
              SizedBox(height: 20),
              WidgetNotebooks(),
              FutureNotes()
            ]
          )
        ),
      )







          /* Stack(children:[
        NestedScrollView(
          headerSliverBuilder: (context, index) {
            return <Widget> [ sliverAppBar(context) ];
          },
          body:
        )
      ]), */
    );
  }

  sliverAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.create),
        color: Color(0xffc8c9de),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Create()));
        }
      ),
      title: Text('Journal', style: GoogleFonts.openSans(
        textStyle: TextStyle(color: Color(0xff373348), fontSize: 20))
      ),
      backgroundColor: Color(0xffeeeef2),
      centerTitle: true,
      automaticallyImplyLeading: false,
      floating: true,
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          color: Color(0xffc8c9de),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HostPorta()));
          },
        )
      ],
    );
  }
}

