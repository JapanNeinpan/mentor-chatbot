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
      question: "Wo ist die Mensa?",
    ),
    new QuestionCard(
      question: "Was für vegane Gerichte gibt es heute",
    ),
    new QuestionCard(
      question: "Welcher Professor korrigiert am besten",
    ),
    new QuestionCard(
      question: "Wie funktioniert Rekursion?",
    ),
    new QuestionCard(
      question: "Wer das liest ist doof",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.separated(
        itemBuilder: (_, index) => _questions[index],
        separatorBuilder: (_, index) => Divider(
          height: 5.0,
          color: new Color.fromRGBO(255, 255, 255, 0.0),
        ),
        itemCount: _questions.length,
        padding: EdgeInsets.all(5.0),
      ),
    );
  }
}

var loremIpsum =
    """Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.""";
