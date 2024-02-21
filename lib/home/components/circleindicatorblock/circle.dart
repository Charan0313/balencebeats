import 'package:flutter/material.dart';

class MyCircle extends StatelessWidget {
  final double value;
  final String amount;
  const MyCircle({
    Key? key,
    required this.value, required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey[300],
              value: value,
            ),
          ),
          Text(amount)
        ],
      ),
    );
  }
}
