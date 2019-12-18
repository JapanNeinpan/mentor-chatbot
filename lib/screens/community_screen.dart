import 'package:flutter/material.dart';
import 'package:mentor_chatbot/widgets/question_card.dart';

class CommunityScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CommunityScreenState();
  }
}

class CommunityScreenState extends State<CommunityScreen> {
  final List<QuestionCard> _questions = <QuestionCard>[
    new QuestionCard(),
    new QuestionCard(),
    new QuestionCard(),
    new QuestionCard(),
    new QuestionCard(),
    new QuestionCard(),
    new QuestionCard(),
    new QuestionCard(),
    new QuestionCard(),
    new QuestionCard(),
    new QuestionCard(),
    new QuestionCard(),
    new QuestionCard(),
    new QuestionCard(),
    new QuestionCard(),
    new QuestionCard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
        itemBuilder: (_, index) => _questions[index],
        itemCount: _questions.length,
      ),
    );
  }
}
