import 'package:balencebeats/home/components/block.dart';
import 'package:flutter/material.dart';

class MyHomecompon extends StatelessWidget {
  const MyHomecompon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              MySmallBlock(
                  imagePath: 'assets/smile.png',
                  text: 'Happy',
                  backgroundColor: Colors.pink),
              MySmallBlock(
                  imagePath: 'assets/Calm.png',
                  text: 'Calm',
                  backgroundColor: Color.fromARGB(255, 113, 51, 219)),
              MySmallBlock(
                  imagePath: 'assets/Relax.png',
                  text: 'Manic',
                  backgroundColor: Color.fromARGB(255, 49, 242, 246)),
              MySmallBlock(
                  imagePath: 'assets/angry.png',
                  text: 'Angry',
                  backgroundColor: Colors.orange),
              MySmallBlock(
                  imagePath: 'assets/angry.png',
                  text: 'Sad',
                  backgroundColor: Color.fromARGB(255, 106, 208, 109))
            ],
          ),
        )
      ],
    );
  }
}
