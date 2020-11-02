import 'package:flutter/material.dart';
import 'package:mentor_chatbot/models/question.model.dart';
import 'package:mentor_chatbot/services/rest.api.service.dart';

class QuestionsResponseDialog extends StatefulWidget {
  final Question question;
  const QuestionsResponseDialog({this.question});

  @override
  State<StatefulWidget> createState() {
    return new QuestionResponseState();
  }
}

class QuestionResponseState extends State<QuestionsResponseDialog> {
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.question.questions[0]["body"]),
      content: _buildTextComposer(),
      actions: <Widget>[
        TextButton(
          child: Text("Send"),
          onPressed: () {
            var text = _textController.text;
            _handleSubmitted(text);
          },
        )
      ],
    );
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                  minLines: 1,
                  maxLines: 6,
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration: new InputDecoration.collapsed(
                    hintText: "Write a reply",
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String answer) {
    var newAnswer = {
      "body": "$answer",
    };
    updateQuestionAnswers(widget.question.id, newAnswer);
  }
}
