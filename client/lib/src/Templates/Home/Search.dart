import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget{
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextField(
        decoration: decoration
      )
    );
  }

  var decoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: Colors.white, width: 0.0),
    ),
    focusedBorder:OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 2.0),
      borderRadius: BorderRadius.circular(20.0),
    ),
    border: new OutlineInputBorder( borderRadius: new BorderRadius.circular(20.0)),
    contentPadding: EdgeInsets.fromLTRB(30, 20, 10, 20),
    suffixIcon: Icon(Icons.search, color: Color(0xffd0d0e0),),
    hintText: 'Search Entries',
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    hintStyle: GoogleFonts.openSans(
        textStyle: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffd0d0e0), fontSize: 20)
    ),
    filled: true,
    fillColor: Colors.white
  );
}

