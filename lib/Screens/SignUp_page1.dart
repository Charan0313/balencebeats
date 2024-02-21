import 'package:balencebeats/Screens/SignUp_Page2.dart';
import 'package:balencebeats/componenets/Text_button.dart';
import 'package:balencebeats/componenets/Text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:math' as math;

class SignUp1 extends StatefulWidget {
  SignUp1({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF0B0B19),
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          elevation: 0,
          title: const Text(
            'Sign up',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF0B0B19),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height / 20,
              ),
              Container(
                padding: EdgeInsets.only(left: Get.width / 15),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hey there',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'How can I help you',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                    Transform.rotate(
                      angle: -math.pi / 4,
                      child: Image.asset(
                        'assets/logoB.png',
                        width: Get.height / 7,
                        height: Get.height / 7,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height / 7),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 15),
                child: MyTextField(
                  hinttext: 'Enter Your Name',
                  unknowntext: false,
                  controller: widget.nameController,
                ),
              ),
              SizedBox(height: Get.height / 50),
              MyButton(
                ontap: () {
                  String name = widget.nameController.text;
                  if (name.isNotEmpty) {
                    Get.to(Signup2(name: name),
                        transition: Transition.rightToLeft);
                  } else {
                    Get.snackbar(
                      'Please enter your name',
                      '',
                      titleText: const Text(
                        'Error',
                        style: TextStyle(color: Colors.red),
                      ),
                      messageText: const Text(
                        'Please enter your name',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                },
                text: 'CONTINUE',
              ),
            ],
          ),
        ));
  }
}
