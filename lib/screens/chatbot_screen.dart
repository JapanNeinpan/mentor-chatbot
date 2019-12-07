import 'package:flutter/material.dart';

class ChatbotScreen extends StatefulWidget {
  @override
  ChatbotScreenState createState() {
    return new ChatbotScreenState();
  }
}

class ChatbotScreenState extends State<ChatbotScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 40, 0, 30),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Enter Text",
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: BorderSide(),
          ),
        ),
        validator: (val) {
          if (val.length == 0) {
            return "Email cannot be empty";
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontFamily: "Poppins",
        ),
      ),
    );
  }
}
