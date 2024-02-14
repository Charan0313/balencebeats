import 'package:balencebeats/Pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.username});
  final String username;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => {},
              icon: Icon(
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
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Text('GOOD MORNING'),
            Text(widget.username),
          ],
        ),
      ),
    );
  }
}
