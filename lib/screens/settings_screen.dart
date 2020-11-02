import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {},
          child: Text('Settings here later!'),
        ),
      ),
    );
  }
}
