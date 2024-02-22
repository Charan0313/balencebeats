import 'package:background_sms/background_sms.dart';
import 'package:balencebeats/home/bargraph/bargraph.dart';
import 'package:balencebeats/home/components/Textblock.dart';
import 'package:balencebeats/home/components/circleindicatorblock/circleindicator.dart';
import 'package:balencebeats/home/components/custom_Icon_text.dart';
import 'package:balencebeats/home/components/sleepblock/sleep_block.dart';
import 'package:balencebeats/home/components/stressblock.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../profile/pages/ProfilePage.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart' as csv;
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

class Homepage extends StatefulWidget {
  const Homepage({Key? key, required this.username});
  final String username;
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<double> values = [30, 20, 70, 40, 80];
  double stressValue = 50; // Initial stress value
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(
              Icons.notifications_outlined,
              color: Color.fromARGB(255, 4, 4, 4),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => {
            Get.to(ProfilePage(
              username: widget.username,
            ))
          },
          child: const Icon(Icons.account_circle),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Afternoon \n${widget.username} !',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              const Text(
                'How are you feeling today?',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              Container(alignment: Alignment.center, child: MyHomeComponent()),
              StressBlock(value: stressValue.toString()),
              isLoading
                  ? Lottie.asset('assets/loader.json')
                  : Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: Get.width / 4),
                      child: ElevatedButton(
                        onPressed: _calculateStress,
                        child: const Text('Calculate Stress'),
                      ),
                    ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 6),
                child: SizedBox(
                    height: Get.height / 4,
                    width: Get.width / 1.5,
                    child: MybarGraph(
                      values: values,
                    )),
              ),
              const SizedBox(height: 10),
              const MySleepBlock(),
              const MyCircleComponent(),
              const Mytextblock(),
            ],
          ),
        ),
      ),
    );
  }

  void smsFunction({required message, required number}) async {
    SmsStatus res =
        await BackgroundSms.sendMessage(phoneNumber: number, message: message);

    print(res);
  }

  Future<List<List<dynamic>>> readCsvFromAssets(String filename) async {
    try {
      // Load the CSV file from assets
      String csvString = await rootBundle.loadString('assets/$filename');

      // Use the csv package to parse the string into a list of lists
      final List<List<dynamic>> csvData = csv.CsvToListConverter()
          .convert(csvString, eol: '\n', fieldDelimiter: ',');

      return csvData;
    } catch (e) {
      // Handle potential errors (e.g., file not found, invalid CSV format)
      print('Error reading CSV file: $e');
      return []; // Or throw an exception if preferred
    }
  }

  // Method to generate a random number within a specific range
  int generateRandomNumber(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min);
  }

  Future<void> _calculateStress() async {
    List<String> numbers = [
      '+918604590834', // Add your numbers here
      '+918076347880'
      // '+918121278087',
      // '+918923194616',
      // '+918074222591',
    ];
    setState(() {
      isLoading = true;
    });

    final csvData = await readCsvFromAssets('x_test.csv');

    final randomIndex = generateRandomNumber(1, csvData.length - 1);
    var randomRow = [csvData[randomIndex].sublist(1)];
    var output = List.filled(1 * 5, 0).reshape([1, 5]);
    final interpreter =
        await tfl.Interpreter.fromAsset('assets/stress_level_predictor.tflite');

    interpreter.run(randomRow, output);

    // Get the maximum value in the output list
    var maxValue = output[0].cast<double>().reduce(
        (double value, double element) => value > element ? value : element);

    // Find the index of the maximum value
    var maxIndex = output[0].indexOf(maxValue).toDouble() + 1.0;
    int newVal = maxIndex.toInt();

    var stressVal = generateRandomNumber((newVal * 20) - 20, newVal * 20);
    stressValue = stressVal.toDouble();

    if (await Permission.sms.request().isGranted) {
      for (String number in numbers) {
        smsFunction(
          message: "Warning!!!. SHishiro is Gaandu.",
          number: number,
        );
      }
    } else {
      final status = await Permission.sms.request();
      if (status.isGranted) {
        for (String number in numbers) {
          smsFunction(
            message: "Warning!!!. SHishiro is Gaandu.",
            number: number,
          );
        }
      }
    }
    setState(() {
      isLoading = false;
    });

    // Schedule the next stress calculation after 30 seconds
    // Timer(const Duration(seconds: 5), _calculateStress);
  }
}
