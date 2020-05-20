class BotResponse {
  final String recipientId;
  final String text;

  BotResponse({this.recipientId, this.text});

  factory BotResponse.fromJson(Map<String, dynamic> json) {
    return BotResponse(
      recipientId: json['recipient_id'],
      text: json['text'],
    );
  }
}
