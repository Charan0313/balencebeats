import 'dart:math';

import 'package:flutter/material.dart';

class MyCircle extends StatelessWidget {
  final double value;
  final int hours; // Received integer value
  final String amount;
  const MyCircle({
    Key? key,
    required this.value,
    required this.hours, // Update to accept integer value
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = 30.0; // Default radius
    double containerSize = 60.0; // Default container size
    double strokeWidth = 10.0; // Default strokeWidth

    if (containerSize < 2 * radius) {
      radius = containerSize / 2;
      strokeWidth = radius / 3;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: containerSize,
                height: containerSize,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(154, 158, 239, 1),
                ),
              ),
              SizedBox(
                width: containerSize - strokeWidth * 2,
                height: containerSize - strokeWidth * 2,
                child: CircularProgressIndicator(
                  strokeWidth: strokeWidth,
                  backgroundColor: Color(0xFFFBDF70),
                  value: value,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              ),
              Center(
                child: Text(
                  '$hours H', // Display received integer value
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              amount,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
