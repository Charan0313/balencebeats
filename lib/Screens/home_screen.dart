import 'package:balencebeats/home/pages/home_page.dart';
import 'package:balencebeats/learn/pages/learn_page.dart';
import 'package:balencebeats/profile/pages/ProfilePage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.username});
  final String username;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myIndex = 0;
  List<Widget> widgetList = const [
    Homepage(),
    Learnpage(),
    Text('message'),
    ProfilePage(username: 'Charan')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: null,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              size: 30,
              Icons.home_outlined,
              color: myIndex == 0
                  ? Color.fromARGB(255, 140, 164, 226)
                  : Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              size: 30,
              Icons.music_note,
              color: myIndex == 1
                  ? Color.fromARGB(255, 140, 164, 226)
                  : Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              size: 26,
              color: myIndex == 2
                  ? Color.fromARGB(255, 140, 164, 226)
                  : Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              size: 30,
              Icons.manage_accounts,
              color: myIndex == 3
                  ? Color.fromARGB(255, 140, 164, 226)
                  : Colors.black,
            ),
            label: '',
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: widgetList[myIndex],
      ),
    );
  }
}
