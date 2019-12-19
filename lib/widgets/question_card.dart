import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  QuestionCard({this.question});
  final String question;
  @override
  State<StatefulWidget> createState() => new QuestionCardState();
}

class QuestionCardState extends State<QuestionCard> {
  int hotness = 123;
  List<bool> _selections = [false];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: new BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ListTile(
          title: new Text("Fragen Titel"),
          subtitle: new Text(widget.question),
          trailing: new Column(
            children: <Widget>[
              new Text(hotness.toString()),
              new ToggleButtons(
                children: <Widget>[
                  Icon(Icons.whatshot),
                ],
                isSelected: _selections,
                onPressed: (int index) {
                  setState(() {
                    _selections[index] = !_selections[index];
                    _selections[index] ? hotness++ : --hotness;
                  });
                },
                renderBorder: false,
                fillColor: Colors.orangeAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
