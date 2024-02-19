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
    );
  }
}
