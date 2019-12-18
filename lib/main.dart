import 'package:flutter/material.dart';
import 'package:mentor_chatbot/screens/chatbot_screen.dart';
import 'package:mentor_chatbot/screens/community_screen.dart';
import 'package:mentor_chatbot/screens/inbox_screen.dart';

void main() => runApp(MentorChatbot());

class MentorChatbot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mentor Chatbot',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(title: 'Willkommen'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _screenOptions = [
    ChatbotScreen(),
    CommunityScreen(),
    InboxScreen(),
  ];

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onNavigationBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mentor Chatbot'),
        centerTitle: true,
      ),
      body: IndexedStack(
        children: _screenOptions,
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Chatbot'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('Community'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            title: Text('Inbox'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onNavigationBarItemTapped,
      ),
    );
  }
}
