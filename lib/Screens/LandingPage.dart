import 'package:balencebeats/Screens/Page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 


class LandingPage extends StatefulWidget {
  const LandingPage({Key? key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    
    Future.delayed(Duration(seconds: 1), () {
      Get.off(() => Page1()); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B0B19),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/logoB.png',
              width: 125.0,
              height: 125.0,
            ),
          ),
         const  SizedBox(height: 20.0),
          const Text(
            'BalenceBeats',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
