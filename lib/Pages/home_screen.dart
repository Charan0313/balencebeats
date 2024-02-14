import 'package:balencebeats/profile/pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.username});
  final String username;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myIndex = 0;
  List<Widget> widgetList = const [
    Text('home'),
    Text('music'),
    Text('check'),
    ProfilePage(username: 'charan')

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined,color: Colors.black,), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.music_note,color: Colors.black,), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.check,color: Colors.black,), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.manage_accounts,color: Colors.black,), label: '')
          ]),
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: const Color.fromARGB(255, 4, 4, 4),
              ))
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => {
            Get.to(ProfilePage(
              username: widget.username,
            ))
          },
          child: Image.asset(
            'assets/logoB.png',
            color: Colors.black,
          ),
        ),
      ),
      
      body: Center(
        child: widgetList[myIndex],
      ),
    );
  }
}
