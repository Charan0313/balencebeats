import 'package:balencebeats/home/components/circleindicatorblock/circle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCircleComponent extends StatelessWidget {
  const MyCircleComponent({super.key});
  final Color customColor = const Color.fromRGBO(154, 158, 239, 1);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          const Text('Your Progress',
              style: TextStyle(color: Colors.black, fontSize: 16)),
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: customColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                MyCircle(
                  value: 0.3,
                  amount: 'M',
                ),
                MyCircle(
                  value: 0.2,
                  amount: 'T',
                ),
                MyCircle(
                  value: 0.7,
                  amount: 'W',
                ),
                MyCircle(
                  value: 0.4,
                  amount: 'T',
                ),
                MyCircle(
                  value: 0.8,
                  amount: 'F',
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
