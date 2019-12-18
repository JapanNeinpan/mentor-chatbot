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
    new QuestionCard(
      question: loremIpsum,
    ),
    new QuestionCard(
      question: loremIpsum,
    ),
    new QuestionCard(
      question: loremIpsum,
    ),
    new QuestionCard(
      question: loremIpsum,
    ),
    new QuestionCard(
      question: loremIpsum,
    ),
    new QuestionCard(
      question: loremIpsum,
    ),
    new QuestionCard(
      question: loremIpsum,
    ),
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

var loremIpsum =
    """Lorem ipsum dolor sit amet, consetetur sadipscing elitr,sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,sed diam voluptua.""";
