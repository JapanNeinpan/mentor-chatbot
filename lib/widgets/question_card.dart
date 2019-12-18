import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  QuestionCard({this.question});
  final String question;
  @override
  State<StatefulWidget> createState() => new QuestionCardState();
}

class QuestionCardState extends State<QuestionCard> {
  int hotness = 0;
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
          subtitle: new Text(widget.question),
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

  void incrHotness() {
    setState(() {
      this.hotness = this.hotness + 1;
    });
  }
}
