import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TempBlock extends StatelessWidget {
  final double tempValue;
  final double maxTemp;
  final double minTemp;

  TempBlock({
    this.tempValue = 0,
    this.maxTemp = 0,
    this.minTemp = 0,
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
            'Body Temperature',
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
                    child: Image.asset('assets/thermometer.png')),
                SizedBox(width: 20),
                // Heart beat value on the right side
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: double.parse(tempValue.toStringAsFixed(2))
                            .toString(),
                        style: TextStyle(
                          fontSize: 32,
                          color: heartColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: '\u00B0C',
                        style: TextStyle(
                          color: waveColor,
                          fontSize: 32,
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
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
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
                            text: double.parse(maxTemp.toStringAsFixed(2))
                                .toString(),
                            style: TextStyle(
                              fontSize: 24,
                              color: heartColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: ' \u00B0C',
                            style: TextStyle(
                              color: waveColor,
                              fontSize: 24,
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
                            text: double.parse(minTemp.toStringAsFixed(2))
                                .toString(),
                            style: TextStyle(
                              fontSize: 24,
                              color: heartColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: '\u00B0C',
                            style: TextStyle(
                              color: waveColor,
                              fontSize: 24,
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
