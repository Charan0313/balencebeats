import 'package:balencebeats/home/bargraph/bargraph.dart';
import 'package:balencebeats/home/components/Textblock.dart';
import 'package:balencebeats/home/components/custom_Icon_text.dart';
import 'package:balencebeats/home/components/sleepblock/sleep_block.dart';
import 'package:balencebeats/home/components/stressblock.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../profile/pages/ProfilePage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key, required this.username});
  final String username;
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<double> values = [30, 20, 70, 40, 80];

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
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => {
            Get.to(ProfilePage(
              username: widget.username,
            ))
          },
          child: const Icon(Icons.account_circle),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Afternoon \n${widget.username}',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              const Text(
                'How are you feeling today?',
              ),
              MyHomecompon(),
              const StressBlock(value: '50'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 6),
                child: SizedBox(
                    height: Get.height / 4,
                    width: Get.width / 1.5,
                    child: MybarGraph(
                      values: values,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              const MySleepBlock(),
              const Mytextblock(),
            ],
          ),
        ),
      ),
    );
  }
}
