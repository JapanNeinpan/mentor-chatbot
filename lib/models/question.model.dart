class Question {
  final String id;
  final int hotness;
  final List<dynamic> questions;
  final List<dynamic> tags;
  final List<dynamic> answers;

  Question({this.id, this.hotness, this.questions, this.tags, this.answers});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['_id'],
      hotness: json['hotness'],
      questions: json['questions'],
      tags: json['tags'],
      answers: json['answers'],
    );
  }
}
