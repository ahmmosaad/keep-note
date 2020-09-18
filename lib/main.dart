import 'package:flutter/material.dart';
import 'package:keep/UIs/home_scr.dart';
import 'package:keep/repo/repo.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListRepo(),
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.white,
            accentColor: Colors.white.withOpacity(.7)),
        home: Home(),
      ),
    );
  }
}
