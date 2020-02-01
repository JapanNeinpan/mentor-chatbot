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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.orangeAccent,
      ),
      child: ListTileTheme(
        contentPadding: EdgeInsets.all(0),
        child: ExpansionTile(
          backgroundColor: new Color.fromRGBO(255, 255, 255, 0.0),
          title: Text(
            widget.question,
            style: TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(hotness.toString()),
              ToggleButtons(
                renderBorder: false,
                borderRadius: BorderRadius.circular(100),
                constraints: BoxConstraints.tight(Size(36, 36)),
                isSelected: _selections,
                children: <Widget>[
                  Icon(
                    Icons.whatshot,
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    _selections[index] = !_selections[index];
                    _selections[index] ? hotness++ : --hotness;
                  });
                },
              ),
            ],
          ),
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Details zu der Frage"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.reply),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
