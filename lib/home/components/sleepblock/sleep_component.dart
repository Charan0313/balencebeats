import 'package:flutter/material.dart';

class SleepComponent extends StatelessWidget {
  final String imageName;
  final String duration;
  final String description;

  const SleepComponent({
    Key? key,
    required this.imageName,
    required this.duration,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Image.asset(
            'assets/$imageName',
            width: 25,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                duration,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                description,
                style: const TextStyle(color: Colors.black, fontSize: 14),
              )
            ],
          )
        ],
      ),
    );
  }
}
