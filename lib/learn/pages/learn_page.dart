import 'package:balencebeats/learn/components/customcontainer.dart';
import 'package:balencebeats/profile/pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Learnpage extends StatefulWidget {
  const Learnpage({Key? key}) : super(key: key);

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
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
              color: Color.fromARGB(255, 4, 4, 4),
            ),
          ),
          SizedBox(width: Get.width / 14)
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.to(const ProfilePage(username: 'charan'));
          },
          child: const Icon(
            Icons.account_circle,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const  Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Learn about \nMental Health !',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              CustomComponent(
                firstText:
                    '4 Common Habits a Sleep Doctor Is Begging You To Stop for the Sake of Your Shut-Eye',
                image: const AssetImage('assets/screen1.png'),
                secondText:
                    'Good sleep can be tough to come by, even when you’re focused on doing all the right sleep-boosting things - like drinking a calming beverage in the evening, doing gentle stretches, and practicing a nighttime ritual, for starters. Because sleep operates in accordance with your circadian rhythm (aka 24-hour body clock), which can be affected by various day and nighttime actions, there are also a handful of ...',
                onTap: () async {
                  const url = 'https://www.google.com';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              CustomComponent(
                firstText:
                    'Agomelatine for Sleep Measures in Obstructive Sleep Apnea',
                image: const AssetImage('assets/screen2.png'),
                secondText:
                    'Obstructive sleep apnea (OSA) is a common sleep disorder in which comorbid insomnia is a frequent complication. While benzodiazepines effectively improve sleep parameters, they may be a poor option for patients with OSA due to their disruption of the respiratory system and sleep rhythmPreviously, research showed that melatonin improved duration and ...',
                onTap: () async {
                  const url = 'https://www.google.com';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              CustomComponent(
                firstText:
                    '4 Common Habits a Sleep Doctor Is Begging You To Stop for the Sake of Your Shut-Eye',
                image: const AssetImage('assets/screen3.png'),
                secondText:
                    'Good sleep can be tough to come by, even when you’re focused on doing all the right sleep-boosting things - like drinking a calming beverage in the evening, doing gentle stretches, and practicing a nighttime ritual, for starters. Because sleep operates in accordance with your circadian rhythm (aka 24-hour body clock), which can be affected by various day and nighttime actions, there are also a handful of ...',
                onTap: () async {
                  const url = 'https://www.google.com';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
