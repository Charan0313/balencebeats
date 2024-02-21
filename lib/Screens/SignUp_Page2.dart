import 'package:balencebeats/Screens/home_screen.dart';
import 'package:balencebeats/componenets/Text_button.dart';
import 'package:balencebeats/componenets/Text_field.dart';
import 'package:balencebeats/user_auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class Signup2 extends StatefulWidget {
  Signup2({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<Signup2> createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B19),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
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
            SizedBox(height: Get.height / 20),
            Container(
              padding: EdgeInsets.only(left: Get.width / 15),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nice to meet you, ${widget.name}!',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Let\'s fill additional data',
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
                    hinttext: 'Enter Your Email',
                    unknowntext: false,
                    controller: emailController,
                  ),
                  SizedBox(height: Get.height / 50),
                  MyTextField(
                    hinttext: 'Enter Your Password',
                    unknowntext: true,
                    controller: passwordController,
                  ),
                  SizedBox(height: Get.height / 50),
                  MyButton(
                    ontap: () {
                      _signUp();
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

  void _signUp() async {
    final user = await FirebaseAuthService()
        .signupAnonymously(emailController.text, passwordController.text);
    if (user != null) {
      Get.offAll(HomePage(
        username: 'charan',
      ));
    } else {
      Get.snackbar(
        'Please enter your name',
        '',
        titleText: const Text(
          'Error',
          style: TextStyle(color: Colors.red),
        ),
        messageText: const Text(
          'enter your valid credentials',
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }
}
