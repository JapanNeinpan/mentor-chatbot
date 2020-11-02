import 'package:flutter/material.dart';

class InboxMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: new ListTile(
        title: Text("Wer is Batman wirklich?"),
        subtitle: Text("0 Antworten auf die Frage"),
        trailing: CircleAvatar(
          child: Center(child: Text("0")),
          maxRadius: 15,
        ),
      ),
    );
  }
}
