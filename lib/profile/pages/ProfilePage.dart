import 'package:balencebeats/Emergencycontacts/pages/em_contact.dart';
import 'package:balencebeats/profile/components/text_bar.dart';
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Image(
                    image: const AssetImage('assets/logoB.png'),
                    width: Get.width / 3.5,
                    height: Get.height / 3.5,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.username,
                    style: const TextStyle(color: Colors.black,fontSize: 30),
                  ),
                ],
              ),
              const TextBar(
                  text: 'Account', icon: Icons.navigate_next_outlined),
              GestureDetector(
                onTap: ()=>{Get.to(EmergengyContact(),transition: Transition.rightToLeft)},
                child: TextBar(
                    text: 'Emergency Contacts',
                    icon: Icons.navigate_next_outlined),
              ),
              const TextBar(
                  text: 'Language', icon: Icons.navigate_next_outlined),
              const TextBar(
                  text: 'Whats new', icon: Icons.navigate_next_outlined),
              const TextBar(text: 'FAQ', icon: Icons.navigate_next_outlined),
              const TextBar(
                  text: 'Terms Of Service ',
                  icon: Icons.navigate_next_outlined),
              const TextBar(
                  text: 'Privacy Policy', icon: Icons.navigate_next_outlined),
              SizedBox(height: Get.height / 4),
            ],
          ),
        ),
      ),
    );
  }
}
