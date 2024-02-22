import 'package:balencebeats/Screens/Login_Page.dart';
import 'package:balencebeats/controllers/introduction_controller.dart';
import 'package:balencebeats/data/introduction_description.dart';
import 'package:flutter/material.dart';
import 'package:balencebeats/componenets/Text_button.dart';
import 'package:balencebeats/componenets/PageIndicator.dart';
import 'package:get/get.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int currentPage = 0;
  int pageCount = 3;

  final IntroductionController introductionController =
      Get.put(IntroductionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B19),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Obx(
              () => Image.asset(
                'assets/screen${introductionController.id.value + 1}.png',
                width: Get.height / 2.5,
                height: Get.height / 2.5,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Get.width / 6),
            child: Obx(
              () => Text(
                introductionController.description.value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 120.0),
          Obx(
            () => PageIndicator(
                currentPage: introductionController.id.value, pageCount: 3),
          ),
          const SizedBox(height: 50.0),
          MyButton(
            ontap: () {
              introductionController.id.value++;
              if (introductionController.id.value > 2) {
                introductionController.id.value = 2;
                Get.to(LoginPage());
              } else {
                introductionController.description.value =
                    descriptionStrings[introductionController.id.value];
              }
            },
            text: 'CONTINUE',
          ),
        ],
      ),
    );
  }

  Widget buildBulletPoint() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '• ',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 5.0),
      ],
    );
  }
}
