import 'package:balencebeats/home/components/Textblock.dart';
import 'package:balencebeats/home/components/activity.dart';
import 'package:balencebeats/home/components/custom_Icon_text.dart';
import 'package:balencebeats/home/components/stressblock.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../profile/pages/ProfilePage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: Color.fromARGB(255, 4, 4, 4),
              ))
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => {
            Get.to(const ProfilePage(
              username: 'charan',
            ))
          },
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Afternoon \nShishiro,',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Text(
                'How are you feeling today?',
              ),
              MyHomecompon(),
              StressBlock(value: '50'),
              ActivityBlock(progressValue: 0.5),
              Mytextblock()
            ],
          ),
        ),
      ),
    );
  }
}
