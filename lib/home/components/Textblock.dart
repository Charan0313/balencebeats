import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mytextblock extends StatelessWidget {
  const Mytextblock({Key? key});

  final Color customColor = const Color.fromRGBO(154, 158, 239, 1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: customColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Personalised Insights',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 222, 219, 219),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Based on your recent metrics, we recommend taking a short break and doing some light exercise.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
