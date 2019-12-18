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
    new InboxMessage(),
    new InboxMessage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: new ListView.builder(
        itemBuilder: (_, index) => _inbox[index],
        itemCount: _inbox.length,
      ),
    );
  }
}
