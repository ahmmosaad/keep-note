import 'package:flutter/material.dart';
import 'package:keep/UIs/home_scr.dart';
import 'package:keep/UIs/note_page.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.white),
      home: Home(),
    );
  }
}
