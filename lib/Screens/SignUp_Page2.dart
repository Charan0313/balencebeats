import 'package:balencebeats/Screens/home_screen.dart';
import 'package:balencebeats/componenets/Text_button.dart';
import 'package:balencebeats/componenets/Text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class Signup2 extends StatefulWidget {
  Signup2({super.key});
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  State<Signup2> createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B0B19),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => {Get.back()},
        ),
        elevation: 0,
        title: Text('Sign up'),
        backgroundColor: Color(0xFF0B0B19),
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
                      const Text(
                        'Nice to meet you, <NAME>!',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Lets fill  additional data',
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
              child: Column(
                children: [
                  MyTextField(
                    hinttext: 'Enter Your Username',
                    unknowntext: false,
                    controller: widget.usernamecontroller,
                  ),
                  SizedBox(height: Get.height / 50),
                  MyTextField(
                    hinttext: 'Enter Your Password',
                    unknowntext: true,
                    controller: widget.passwordcontroller,
                  ),
                  SizedBox(height: Get.height / 50),
                  MyButton(
                    ontap: () {
                      final enteredUsername = widget.usernamecontroller.text;
                      Get.to(
                        () => HomePage(
                            username: enteredUsername), 
                        transition: Transition.rightToLeft,
                      );
                    },
                    text: 'SIGN UP',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
