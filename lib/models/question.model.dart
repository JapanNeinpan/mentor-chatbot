class Question {
  final String id;
  final int hotness;
  final String question;
  final String author;
  final List<dynamic> tags;
  final List<dynamic> answers;

  Question(
      {this.id,
      this.hotness,
      this.question,
      this.author,
      this.tags,
      this.answers});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['_id'],
      hotness: json['hotness'],
      question: json['question'],
      author: json['author'],
      tags: json['tags'],
      answers: json['answers'],
    );
  }
}
