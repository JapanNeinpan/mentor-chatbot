import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  QuestionCard({this.question, this.questionDetails});
  final String question;
  final String questionDetails;
  @override
  State<StatefulWidget> createState() => new QuestionCardState();
}

class QuestionCardState extends State<QuestionCard> {
  int hotness = 123;
//  List<bool> _selections = [false];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Theme.of(context).cardColor,
      ),
      child: ListTileTheme(
        contentPadding: EdgeInsets.all(5),
        child: ExpansionTile(
          backgroundColor: new Color.fromRGBO(255, 255, 255, 0.0),
          title: Text(
            widget.question,
//            style: TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
//              Text(hotness.toString()),
              IconButton(
                icon: Icon(Icons.whatshot),
                onPressed: () => {},
              ),
//              ToggleButtons(
//                renderBorder: false,
//                borderRadius: BorderRadius.circular(100),
//                constraints: BoxConstraints.tight(Size(36, 36)),
//                isSelected: _selections,
//                children: <Widget>[
//                  Icon(
//                    Icons.whatshot,
//                  ),
//                ],
//                onPressed: (int index) {
//                  setState(() {
//                    _selections[index] = !_selections[index];
//                    _selections[index] ? hotness++ : --hotness;
//                  });
//                },
//              ),
            ],
          ),
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(widget.questionDetails),
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
