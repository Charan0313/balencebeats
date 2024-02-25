import 'dart:math';
import 'package:flutter/material.dart';
import 'sleep_component.dart';

class MySleepBlock extends StatelessWidget {
  final double sleepDurationInHours;

  MySleepBlock({Key? key, required this.sleepDurationInHours})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Convert the sleep duration from decimal hours to hours and minutes
    int hours = sleepDurationInHours.floor();
    int minutes = ((sleepDurationInHours - hours) * 60).round();

    // Generate logical random values for wake up time, went to bed, and fell asleep
    Random random = Random();
    int wakeUpHour = random.nextInt(3) + 6; // Random hour between 6 AM and 8 AM
    int wakeUpMinute = random.nextInt(60);
    int goToBedHour =
        random.nextInt(5) + 21; // Random hour between 9 PM and 1 AM
    int goToBedMinute = random.nextInt(60);
    int fellAsleepHour = (goToBedHour + random.nextInt(2)) %
        24; // Random hour within 2 hours after bedtime
    int fellAsleepMinute = random.nextInt(60);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(154, 158, 239, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Text(
              'Last Sleep Information',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20), // Increased font size by 4 units
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SleepComponent(
                            imageName: 'moon.png',
                            duration: '$hours h $minutes m',
                            description: 'Time in sleep',
                          ),
                          const SizedBox(height: 10),
                          SleepComponent(
                            imageName: 'clock.png',
                            duration: '$goToBedHour : $goToBedMinute PM ',
                            description: 'went to bed',
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          SleepComponent(
                            imageName: 'warm weather.png',
                            duration: '$wakeUpHour : $wakeUpMinute AM',
                            description: 'wake up time',
                          ),
                          const SizedBox(height: 10),
                          SleepComponent(
                            imageName: 'snor.png',
                            duration: '$fellAsleepHour : $fellAsleepMinute PM',
                            description: 'Fell asleep',
                          ),
                        ],
                      ),
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
