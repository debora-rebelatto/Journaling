import 'package:flutter/material.dart';
import 'package:journal_app/src/Templates/InitialScreen/InitialScreen.dart';

void main() {
  runApp(Journaling());
}

class Journaling extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Color(0xffeeeef2),
        scaffoldBackgroundColor: Color(0xffeeeef2)
      ),
      home: InitialScreen(),
    );
  }
}