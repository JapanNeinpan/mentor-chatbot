import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  String question;
  int hotness;
  @override
  State<StatefulWidget> createState() {
    return new QuestionCardState();
  }
}

class QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: new BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListTile(
          title: new Text("Fragen Titel"),
          subtitle: new Text(loremIpsum),
          isThreeLine: true,
          trailing: new Column(
            children: <Widget>[
              new Text("123"),
              new Icon(Icons.whatshot),
            ],
          ),
        ),
      ),
    );
  }
}

String loremIpsum =
    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.";
