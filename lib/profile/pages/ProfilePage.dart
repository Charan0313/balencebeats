import 'package:balencebeats/Emergencycontacts/pages/em_contact.dart';
import 'package:balencebeats/profile/components/privacypolicy.dart';
import 'package:balencebeats/profile/components/terms.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 125.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: const AssetImage('assets/charan.jpg'),
                    radius: Get.height / 16,
                  ),
                  SizedBox(
                    width: Get.width / 8,
                  ),
                  Text(
                    widget.username,
                    style: const TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ],
              ),

              SizedBox(height: Get.height/12,),
              const TextBar(
                  text: 'Account', icon: Icons.navigate_next_outlined),
              GestureDetector(
                onTap: () => {
                  Get.to(EmergengyContact(), transition: Transition.rightToLeft)
                },
                child: const TextBar(
                    text: 'Emergency Contacts',
                    icon: Icons.navigate_next_outlined),
              ),
              const TextBar(
                  text: 'Language', icon: Icons.navigate_next_outlined),
              const TextBar(
                  text: 'Whats new', icon: Icons.navigate_next_outlined),
              const TextBar(text: 'FAQ', icon: Icons.navigate_next_outlined),
              GestureDetector(
                onTap: () => {Get.to(MyTerms(), transition: Transition.rightToLeft)},
                child: const TextBar(
                    text: 'Terms Of Service ',
                    icon: Icons.navigate_next_outlined),
              ),
              GestureDetector(
                onTap: () => {
                  Get.to(MyPrivacyPolicy(), transition: Transition.rightToLeft)
                },
                child: const TextBar(
                    text: 'Privacy Policy', icon: Icons.navigate_next_outlined),
              ),
              SizedBox(height: Get.height / 4),
            ],
          ),
        ),
      ),
    );
  }
}
