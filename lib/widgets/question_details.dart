import 'package:flutter/material.dart';

class QuestionDetails extends StatefulWidget {
  QuestionDetails({this.question});
  final question;

  @override
  State<StatefulWidget> createState() => new QuestionDetailsState();
}

class QuestionDetailsState extends State<QuestionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mentor Chatbot"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Placeholder(
            fallbackHeight: 100,
          ),
          Placeholder(
            fallbackHeight: 100,
          ),
          Placeholder(
            fallbackHeight: 100,
          ),
        ],
      ),
    );
  }
}
