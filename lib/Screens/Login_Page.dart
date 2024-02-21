import 'package:balencebeats/Screens/SignUp_page1.dart';
import 'package:balencebeats/Screens/home_screen.dart';
import 'package:balencebeats/componenets/Text_button.dart';
import 'package:balencebeats/componenets/Text_field.dart';
import 'package:balencebeats/user_auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B0B19),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height / 18,
            ),
            Center(
              child: Image.asset(
                'assets/logoB.png',
                height: Get.height / 3,
                width: Get.width / 3,
              ),
            ),
            SizedBox(height: Get.height / 35),
            Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: MyTextField(
                hinttext: 'Email',
                unknowntext: false,
                controller: emailController,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: MyTextField(
                hinttext: 'Password',
                unknowntext: true,
                controller: passController,
              ),
            ),
            SizedBox(
              height: Get.height / 50,
            ),
            Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: MyTextField(
                hinttext: 'Username',
                unknowntext: false,
                controller: usernameController,
              ),
            ),
            SizedBox(height: Get.height / 13),
            MyButton(
              ontap: () {
                _signIn();
              },
              text: 'LOGIN',
            ),
            SizedBox(
              height: Get.height / 50,
            ),
            GestureDetector(
              onTap: () {
                Get.to(SignUp1(), transition: Transition.rightToLeft);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 28),
                child: RichText(
                  text: const TextSpan(
                    text: 'Forgot your password ? ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 205, 204, 204),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    final user = await FirebaseAuthService()
        .signinAnonymously(emailController.text, passController.text);
    if (user != null) {
      Get.offAll(HomePage(
        username: usernameController.text,
      ));
    } else {
      Get.snackbar(
        'Error',
        'Enter your details to get started',
        titleText: const Text('Error', style: TextStyle(color: Colors.red)),
        messageText: const Text(
          'Please provide valid information to proceed.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      );
    }
  }
}
