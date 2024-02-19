import 'package:balencebeats/learn/components/customcontainer.dart';
import 'package:balencebeats/profile/pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Learnpage extends StatefulWidget {
  const Learnpage({super.key});

  @override
  State<Learnpage> createState() => _LearnpageState();
}

class _LearnpageState extends State<Learnpage> {
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
        body:  const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Learn about \nMental Health',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                CustomComponent(
                    firstText:
                        '4 Common Habits a Sleep Doctor Is Begging You To Stop for the Sake of Your Shut-Eye',
                    image: AssetImage('assets/screen1.png'),
                    secondText:
                        'Good sleep can be tough to come by, even when you’re focused on doing all the right sleep-boosting things - like drinking a calming beverage in the evening, doing gentle stretches, and practicing a nighttime ritual, for starters. Because sleep operates in accordance with your circadian rhythm (aka 24-hour body clock), which can be affected by various day and nighttime actions, there are also a handful of ...'),
                CustomComponent(
                    firstText:
                        '4 Common Habits a Sleep Doctor Is Begging You To Stop for the Sake of Your Shut-Eye',
                    image: AssetImage('assets/screen1.png'),
                    secondText:
                        'Good sleep can be tough to come by, even when you’re focused on doing all the right sleep-boosting things - like drinking a calming beverage in the evening, doing gentle stretches, and practicing a nighttime ritual, for starters. Because sleep operates in accordance with your circadian rhythm (aka 24-hour body clock), which can be affected by various day and nighttime actions, there are also a handful of ...')
              ],
            ),
          ),
        ));
  }
}
