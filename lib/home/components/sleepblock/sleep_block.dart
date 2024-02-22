import 'package:balencebeats/home/components/sleepblock/sleep_component.dart';
import 'package:flutter/material.dart';

class MySleepBlock extends StatelessWidget {
  const MySleepBlock({Key? key});
  final Color customColor = const Color.fromRGBO(154, 158, 239, 1);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: customColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: Text(
                'Last Sleep information',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SleepComponent(
                        imageName: 'moon.png',
                        duration: '6h 30m',
                        description: 'Time in sleep',
                      ),
                      SleepComponent(
                        imageName: 'warm weather.png',
                        duration: '7 : 12 AM',
                        description: 'wake up time',
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SleepComponent(
                        imageName: 'clock.png',
                        duration: '7h 32m ',
                        description: 'went to bed',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SleepComponent(
                        imageName: 'snor.png',
                        duration: '8h 30m',
                        description: 'Fell asleep',
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
