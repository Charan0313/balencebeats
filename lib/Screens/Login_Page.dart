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
  TextEditingController EmailController = TextEditingController();
  TextEditingController PassController = TextEditingController();
  @override
  void dispose() {
    EmailController.dispose();
    PassController.dispose();
    super.dispose();
  }

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
                controller: EmailController,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: MyTextField(
                hinttext: 'Password',
                unknowntext: true,
                controller: PassController,
              ),
            ),
            SizedBox(
              height: Get.height / 50,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 28),
              child: const Text(
                'Forgot your password ?',
                style: TextStyle(color: Color.fromARGB(255, 205, 204, 204)),
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
        .signinAnonymously(EmailController.text, PassController.text);
    if (user != null) {
      Get.offAll(HomePage(
        username: 'charan',
      ));
    } else {
      Get.snackbar('Error', 'Some error occurred');
    }
  }
}
