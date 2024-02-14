import 'package:balencebeats/Pages/EcontactPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.username});
  final String username;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Image(
                  image: AssetImage('assets/logoB.png'),
                  width: Get.width / 3.5,
                  height: Get.height / 3.5,
                ),
                SizedBox(width: 10),
                Text(
                  widget.username,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
