import 'package:flutter/material.dart';
import 'package:mentor_chatbot/widgets/chat_message.dart';

class ChatbotScreen extends StatefulWidget {
  @override
  ChatbotScreenState createState() {
    return new ChatbotScreenState();
  }
}

class ChatbotScreenState extends State<ChatbotScreen>
    with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[
    new ChatMessage(
      text: "Ja bitte ..",
      isSent: true,
    ),
    new ChatMessage(
      text: "Ich kann ne ganze Menge, ich kann dir einen Witz erzählen",
      isSent: false,
    ),
    new ChatMessage(
      text: "Was kannst du alles?",
      isSent: true,
    ),
    new ChatMessage(
      text: "Hallo wie kann ich dir helfen?",
      isSent: false,
    ),
    new ChatMessage(
      text: "Hallo",
      isSent: true,
    ),
  ];
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.separated(
              padding: new EdgeInsets.all(8.0),
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
              borderRadius: BorderRadius.circular(25.0),
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
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
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
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      isSent: true,
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

  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }
}
