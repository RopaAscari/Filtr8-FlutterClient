import 'package:flutter/material.dart';
import '../../services/hexConverter.dart';

class Settings extends StatefulWidget {
  Settings({Key, key, this.title}) : super(key: key);

  final String title;

  SettingsScreen createState() => SettingsScreen();
}

@override
class SettingsScreen extends State<Settings> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: <Widget>[Text("Gallery")])));
  }
}
