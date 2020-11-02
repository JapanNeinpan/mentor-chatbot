import 'package:flutter/material.dart';
import 'package:mentor_chatbot/screens/chatbot_screen.dart';
import 'package:mentor_chatbot/screens/community_screen.dart';
import 'package:mentor_chatbot/screens/inbox_screen.dart';
import 'package:mentor_chatbot/screens/settings_screen.dart';

void main() => runApp(MentorChatbot());

class MentorChatbot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Mentor Chatbot',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: MainPage(title: 'Willkommen'),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final _screenOptions = [
    ChatbotScreen(),
    CommunityScreen(),
    InboxScreen(),
  ];

  // static const TextStyle optionStyle = TextStyle(
  //   fontSize: 30,
  //   fontWeight: FontWeight.bold,
  // );

  void _onNavigationBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _pushSettings() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return SettingsScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mentor Chatbot'),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.settings),
            onPressed: _pushSettings,
          ),
        ],
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: const <Widget>[
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.deepPurple,
      //         ),
      //         child: Text(
      //           'Profile',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.account_circle),
      //         title: Text('Profile'),
      //       ),
      //     ],
      //   ),
      // ),
      body: IndexedStack(
        children: _screenOptions,
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chatbot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'Inbox',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onNavigationBarItemTapped,
      ),
    );
  }
}
