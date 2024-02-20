import 'package:flutter/material.dart';

class MySmallBlock extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color backgroundColor;

  const MySmallBlock({
    required this.imagePath,
    required this.text,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 10),
      child: Column(
        children: [
          Container(
            width: 50, 
            height: 53, 
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              imagePath,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
