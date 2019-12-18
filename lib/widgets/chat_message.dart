import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController, this.isSent});
  final String text;
  final bool isSent;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return Bubble(
      child: Text(text),
      nip: isSent ? BubbleNip.rightTop : BubbleNip.leftTop,
      margin: isSent
          ? BubbleEdges.only(left: 50.0, bottom: 5.0, top: 5.0)
          : BubbleEdges.only(right: 50.0, bottom: 5.0, top: 5.0),
      alignment: isSent ? Alignment.topRight : Alignment.topLeft,
      color: isSent ? Color.fromRGBO(225, 255, 199, 1.0) : Colors.white,
    );
//    return new Container(
//        margin: isSent
//            ? EdgeInsets.only(left: 50.0, bottom: 5.0, top: 5.0)
//            : EdgeInsets.only(right: 50.0, bottom: 5.0, top: 5.0),
//        decoration: new BoxDecoration(
//          borderRadius: BorderRadius.circular(5),
//          color: isSent ? Colors.green : Colors.blueAccent,
//        ),
//        child: new Container(
//          margin: const EdgeInsets.all(5.0),
//          child: new Text(text),
//        ));
  }
}
