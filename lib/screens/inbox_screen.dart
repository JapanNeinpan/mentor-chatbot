import 'package:flutter/material.dart';

class InboxScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new InboxScreenState();
  }
}

class InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      child: Text("Inbox page works!"),
    );
  }
}
