import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityBlock extends StatelessWidget {
  final double progressValue;
  final Color customColor = const Color.fromRGBO(154, 158, 239, 1);

  const ActivityBlock({Key? key, required this.progressValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Container(
        width: Get.width ,
      // height: Get.height,
        decoration: BoxDecoration(
          color: customColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your Activity',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: Get.width /2,
                  height: Get.height / 4,
                  child: CircularProgressIndicator(
                    value: progressValue,
                    color: Colors.white,
                    backgroundColor: Colors.white.withOpacity(0.4),
                    strokeWidth: 8,
                  ),
                ),
                Text(
                  '${(progressValue * 100).toStringAsFixed(0)}%',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
