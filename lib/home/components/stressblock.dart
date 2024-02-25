import 'package:flutter/material.dart';

class StressBlock extends StatelessWidget {
  const StressBlock({Key? key, required this.value}) : super(key: key);
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(154, 158, 239, 1), // Change color as needed
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.sentiment_satisfied_alt_rounded,
                color: _getStressColor(value),
                size: 36,
              ),
              const SizedBox(width: 10),
              Text(
                'Your Stress Levels',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: _getStressColor(value),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStressColor(String value) {
    double stressValue = double.tryParse(value) ?? 0;
    if (stressValue <= 30) {
      return Colors.green.shade600;
    } else if (stressValue <= 60) {
      return Colors.orange.shade400;
    } else {
      return Colors.red.shade800;
    }
  }
}
