import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mytextblock extends StatelessWidget {
  const Mytextblock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height/2,
      decoration: BoxDecoration(),
      child: const  Column(
        children: [Text('Personalised Insights',style: TextStyle(fontSize: 14),)],
      ),
    );
  }
}
