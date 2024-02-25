import 'dart:math';

import 'package:balencebeats/home/components/circleindicatorblock/circle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCircleComponent extends StatelessWidget {
  final List hoursList; // List of values for hours
  const MyCircleComponent({Key? key, required this.hoursList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(154, 158, 239, 1), // Custom color
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Your Weekly Activity',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 4; i++)
                  MyCircle(
                    value: (0.1 * hoursList[i]).toDouble(),
                    hours: hoursList[i],
                    amount: _getDayName(i),
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 4; i < 7; i++)
                  MyCircle(
                    value: (0.1 * hoursList[i]).toDouble(),
                    hours: hoursList[i],
                    amount: _getDayName(i),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  String _getDayName(int index) {
    switch (index) {
      case 0:
        return 'Mon';
      case 1:
        return 'Tue';
      case 2:
        return 'Wed';
      case 3:
        return 'Thu';
      case 4:
        return 'Fri';
      case 5:
        return 'Sat';
      case 6:
        return 'Sun';
      default:
        return '';
    }
  }
}
