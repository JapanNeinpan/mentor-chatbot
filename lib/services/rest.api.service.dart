import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mentor_chatbot/models/question.model.dart';
import 'package:mentor_chatbot/widgets/question_card.dart';

Future<List<QuestionCard>> fetchQuestions() async {
  final response =
      await http.get('https://mentor-chatbot.appspot.com/questions');
  if (response.statusCode == 200) {
    var questions = (json.decode(response.body) as List)
        .map((questionJson) => new Question.fromJson(questionJson))
        .map((question) => new QuestionCard(question: question))
        .toList();
    return questions;
  } else {
    throw Exception('Failed to load questions');
  }
}
