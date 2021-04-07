import 'package:flutter/material.dart';
import './src/Templates/Home/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Color(0xffeeeef2),
  scaffoldBackgroundColor: Color(0xffeeeef2)
      ),
      home: Home(),
    );
  }
}