import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CommunityScreenState();
  }
}

class CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      child: Text("Community page works!"),
    );
  }
}
