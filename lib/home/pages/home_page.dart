import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:balencebeats/home/bargraph/bargraph.dart';
import 'package:balencebeats/home/components/Textblock.dart';
import 'package:balencebeats/home/components/circleindicatorblock/circleindicator.dart';
import 'package:balencebeats/home/components/custom_Icon_text.dart';
import 'package:balencebeats/home/components/sleepblock/sleep_block.dart';
import 'package:balencebeats/home/components/stressblock.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../profile/pages/ProfilePage.dart';
import 'package:lottie/lottie.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key, required this.username});
  final String username;
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<double> values = [30, 20, 70, 40, 80];
  double stressValue = 50; // Initial stress value
  bool isLoading = false;

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
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Afternoon \n${widget.username} !',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              const Text(
                'How are you feeling today?',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              Container(alignment: Alignment.center, child: MyHomeComponent()),
              StressBlock(value: stressValue.toString()),
              isLoading
                  ? Lottie.asset('assets/loader.json')
                  : Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: Get.width / 4),
                      child: ElevatedButton(
                        onPressed: _calculateStress,
                        child: const Text('Calculate Stress'),
                      ),
                    ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 6),
                child: SizedBox(
                    height: Get.height / 4,
                    width: Get.width / 1.5,
                    child: MybarGraph(
                      values: values,
                    )),
              ),
              const SizedBox(height: 10),
              const MySleepBlock(),
              const MyCircleComponent(),
              const Mytextblock(),
            ],
          ),
        ),
      ),
    );
  }

  void _calculateStress() {
    setState(() {
      isLoading = true;
    });
    // Fetch random row of data from JSON file
    // Replace 'constants.json' with your JSON file path
    final jsonStr =
        '{"stress": ${Random().nextInt(100)}}'; // Example JSON string
    final Map<String, dynamic> jsonData = json.decode(jsonStr);
    final int input = jsonData['stress'];

    // Run TensorFlow Lite model with the input data to calculate stress value
    // Replace the following code with your TensorFlow Lite model inference logic
    // Example: double stressValue = myModel.infer(input);
    // For simplicity, setting stressValue as a random number here
    stressValue = input.toDouble();

    setState(() {
      isLoading = false;
    });

    // Schedule the next stress calculation after 30 seconds
    Timer(const Duration(seconds: 5), _calculateStress);
  }
}
