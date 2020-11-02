import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mentor_chatbot/models/question.model.dart';
import 'package:mentor_chatbot/widgets/question_card.dart';

const apiBaseUrl = 'https://mentor-chatbot.appspot.com';

Future<List<QuestionCard>> fetchQuestions() async {
  final response = await http.get(apiBaseUrl + "/questions");
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

void updateQuestionAnswers(String id, Object update) async {
  log(jsonEncode(update));
  final response =
      await http.put(apiBaseUrl + "/questions/$id", body: jsonEncode(update));
  if (response.statusCode == 200) {
    log("Update successful");
  } else {
    throw Exception('Failed to update answer');
  }
}
