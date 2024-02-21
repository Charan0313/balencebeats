import 'package:balencebeats/home/components/block.dart';
import 'package:balencebeats/home/components/selection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomecompon extends StatelessWidget {
  final SelectionController controller = Get.put(SelectionController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  MySmallBlock(
                    imagePath: 'assets/smile.png',
                    text: 'Happy',
                    backgroundColor: Colors.pink,
                    onTap: () => controller.setSelectedText('Great to hear! Keep up the positivity!'),
                  ),
                  MySmallBlock(
                    imagePath: 'assets/Calm.png',
                    text: 'Calm',
                    backgroundColor: const Color.fromARGB(255, 113, 51, 219),
                    onTap: () => controller.setSelectedText('Relax, Im here to assist you'),
                  ),
                  MySmallBlock(
                    imagePath: 'assets/angry.png',
                    text: 'Angry',
                    backgroundColor: Colors.orange,
                    onTap: () => controller.setSelectedText('Take deep breaths, count to ten'),
                  ),
                  MySmallBlock(
                    imagePath: 'assets/Relax.png',
                    text: 'Neautral',
                    backgroundColor: const Color.fromARGB(255, 75, 163, 235),
                    onTap: () => controller.setSelectedText('Neautral :)'),
                  ),
                  MySmallBlock(
                    imagePath: 'assets/angry.png',
                    text: 'Sad',
                    backgroundColor: const Color.fromARGB(255, 106, 208, 109),
                    onTap: () => controller.setSelectedText('Allow yourself to feel, then heal.'),
                  ),
                ],
              ),
            ),
          ),
          const  SizedBox(height: 5),
          Obx(() => Text(
            controller.selectedText.isNotEmpty
                ? ' ${controller.selectedText.value}'
                : '',
            style: const TextStyle(fontSize: 16),
          )),
        ],
      ),
    );
  }
}
