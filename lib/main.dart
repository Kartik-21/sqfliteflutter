import 'package:flutter/material.dart';
import 'package:sqfliteflutter/screens/NoteList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Note Keeper",
      home: NoteList(),
      initialRoute: '/',
      theme: ThemeData(
        accentColor: Colors.indigoAccent,
        primaryColor: Colors.indigo,
        brightness: Brightness.dark,
      ),
    );
  }
}
