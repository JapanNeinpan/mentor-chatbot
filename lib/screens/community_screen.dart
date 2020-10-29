import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mentor_chatbot/services/rest.api.service.dart';
import 'package:mentor_chatbot/widgets/question_card.dart';

class CommunityScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CommunityScreenState();
  }
}

class CommunityScreenState extends State<CommunityScreen> {
  Future<List<QuestionCard>> _questions;

  @override
  void initState() {
    super.initState();
    _questions = fetchQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: FutureBuilder(
            future: _questions,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return new ListView.separated(
                  itemBuilder: (_, index) {
                    return snapshot.data[index];
                  },
                  separatorBuilder: (_, index) => Divider(
                    height: 5.0,
                    color: new Color.fromRGBO(255, 255, 255, 0.0),
                  ),
                  itemCount: snapshot.data.length,
                  padding: EdgeInsets.all(5.0),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    Completer<Null> completer = new Completer<Null>();

    setState(() {
      _questions = fetchQuestions();
    });

    completer.complete();
    return completer.future;
  }
}
