import 'package:flutter/material.dart';
import 'package:mentor_chatbot/widgets/inbox_message.dart';

class InboxScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new InboxScreenState();
  }
}

class InboxScreenState extends State<InboxScreen> {
  final List<InboxMessage> _inbox = <InboxMessage>[
    new InboxMessage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: new ListView.separated(
        itemBuilder: (_, index) => _inbox[index],
        separatorBuilder: (_, index) => Divider(
          height: 5.0,
          color: new Color.fromRGBO(255, 255, 255, 0.0),
        ),
        itemCount: _inbox.length,
        padding: EdgeInsets.all(5.0),
      ),
    );
  }
}
