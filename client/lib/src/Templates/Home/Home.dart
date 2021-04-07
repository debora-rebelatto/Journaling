import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:journal_app/src/Templates/Home/IDK.dart';
import 'package:journal_app/src/Templates/WidgetNotebooks/WidgetNotebooks.dart';
import 'package:journal_app/src/Templates/WidgetNotes/WidgetNotes.dart';

import '../Create.dart';
import 'Search.dart';
import 'Settings.dart';

class Home extends StatefulWidget{ HomeState createState() => HomeState(); }

class HomeState extends State<Home>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeef2),
      body: Stack(children:[
        NestedScrollView(
          headerSliverBuilder: (context, index) {
            return <Widget> [ sliverAppBar(context) ];
          },
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Search(),
                StuffIdk(),
                Stack(children: [ WidgetNotebooks() ]),
                WidgetNotes()
              ],
            )
          )
        )
      ]),
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

