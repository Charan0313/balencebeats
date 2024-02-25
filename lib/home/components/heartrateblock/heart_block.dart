import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HeartRateBlock extends StatelessWidget {
  final int heartRateValue;
  final int averageBpm;
  final int maxRate;
  final int minRate;

  HeartRateBlock({
    this.heartRateValue = 0,
    this.averageBpm = 0,
    this.maxRate = 0,
    this.minRate = 0,
  });

  @override
  Widget build(BuildContext context) {
    Color heartColor = Colors.red; // Customize as needed
    Color waveColor = Colors.blue; // Customize as needed

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Heart Rate',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: waveColor,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Lottie animation on the left side
                Container(
                  width: 100, // Adjust width as needed
                  height: 100, // Adjust height as needed
                  child: Lottie.asset('assets/heart.json'),
                ),
                SizedBox(width: 20),
                // Heart beat value on the right side
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: heartRateValue.toString(),
                        style: TextStyle(
                          fontSize: 23,
                          color: heartColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' BPM',
                        style: TextStyle(
                          color: waveColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: averageBpm.toString(),
                        style: TextStyle(
                          fontSize: 23,
                          color: heartColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' BPM',
                        style: TextStyle(
                          color: waveColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: '\nAVERAGE',
                        style: TextStyle(
                          fontSize: 30,
                          color: waveColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.start,
                ),
                Lottie.asset(
                  "assets/heart_rate.json",
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'MAX\n',
                            style: TextStyle(
                              fontSize: 30,
                              color: waveColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: maxRate.toString(),
                            style: TextStyle(
                              fontSize: 23,
                              color: heartColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: ' BPM',
                            style: TextStyle(
                              color: waveColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'MIN\n',
                            style: TextStyle(
                              fontSize: 30,
                              color: waveColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: minRate.toString(),
                            style: TextStyle(
                              fontSize: 23,
                              color: heartColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: ' BPM',
                            style: TextStyle(
                              color: waveColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
