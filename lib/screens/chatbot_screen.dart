import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:http/http.dart' as http;
import 'package:mentor_chatbot/widgets/chat_message.dart';

class ChatbotScreen extends StatefulWidget {
  @override
  ChatbotScreenState createState() {
    return new ChatbotScreenState();
  }
}

class ChatbotScreenState extends State<ChatbotScreen>
    with TickerProviderStateMixin {
  SocketIO socketIO;
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.separated(
              padding: new EdgeInsets.all(5.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              separatorBuilder: (_, index) => Divider(
                height: 5.0,
                color: new Color.fromRGBO(255, 255, 255, 0.0),
              ),
              itemCount: _messages.length,
            ),
          ),
          new Container(
            child: _buildTextComposer(),
            margin: EdgeInsets.all(5.0),
            decoration: new BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.only(left: 12.0, right: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () {
                    var text = _textController.text;
                    _handleSubmitted(text);
                    fetchBotResponse(text);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _pushMessageBubble(text, true);
  }

  void _pushMessageBubble(String text, bool isSent) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      isSent: isSent,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 200),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

  Future<void> fetchBotResponse(String text) async {
    var headers = {HttpHeaders.contentTypeHeader: ContentType.json.toString()};
    final response =
        await http.post("http://mentor-chatbot.me/core/webhooks/rest/webhook",
            // TODO move this url to global config
            headers: headers,
            body: jsonEncode({"sender": "Mobile", "message": "$text"}));
    if (response.statusCode == 200) {
      var botResponses = jsonDecode(response.body);
      for (var botResponse in botResponses) {
        _pushMessageBubble(botResponse["text"], false);
      }
    } else {
      throw Exception('Failed to fetch bot response');
    }
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }
}
