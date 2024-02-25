import 'package:background_sms/background_sms.dart';
// import 'package:balencebeats/home/bargraph/bargraph.dart';
// import 'package:balencebeats/home/components/Textblock.dart';
import 'package:balencebeats/home/components/circleindicatorblock/circleindicator.dart';
import 'package:balencebeats/home/components/custom_Icon_text.dart';
import 'package:balencebeats/home/components/heartrateblock/heart_block.dart';
import 'package:balencebeats/home/components/sleepblock/sleep_block.dart';
import 'package:balencebeats/home/components/stressblock.dart';
import 'package:balencebeats/home/components/temperature/temperature.dart';
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
import 'package:balencebeats/Emergencycontacts/contacts.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key, required this.username});
  final String username;
  @override
  State<Homepage> createState() => _HomepageState();
}

class SimpleElevatedButtonWithIcon extends StatelessWidget {
  const SimpleElevatedButtonWithIcon(
      {required this.label,
      this.color,
      this.iconData,
      required this.onPressed,
      this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      Key? key})
      : super(key: key);
  final Widget label;
  final Color? color;
  final IconData? iconData;
  final Function onPressed;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed as void Function()?,
      icon: Icon(iconData, color: Colors.white),
      label: label,
      style: ElevatedButton.styleFrom(backgroundColor: color, padding: padding),
    );
  }
}

class _HomepageState extends State<Homepage> {
  List<double> values = [30, 20, 70, 40, 80];
  List<int> hours = [0, 0, 0, 0, 0, 0, 0];
  double stressValue = 0; // Initial stress value
  bool isLoading = false;
  double sleep = 0.0;
  int minRate = 0;
  int maxRate = 0;
  int averageBpm = 0;
  int heartRateValue = 0;
  double tempValue = 0;
  double maxTemp = 0;
  double minTemp = 0;
  late Timer _stressTimer;

  @override
  void initState() {
    super.initState();
    // Show dialog when the page is opened
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _showInitialDialog();
    });
  }

  void _showInitialDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Disclaimer! \nDummy Data In Use!'),
          content: Text(
              'Welcome to Balance Beats, ${widget.username}! \nThe data displayed in this app is not accurate as it does not reflect real-time information from external sources. We do not have access to the data provided by companies for integration into the application.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

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
          child: Lottie.asset('assets/male-avatar.json'),
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

              isLoading
                  ? Lottie.asset('assets/loading-square.json')
                  : Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width / 4, vertical: 5),
                      child: SimpleElevatedButtonWithIcon(
                        label: const Text(
                          'Calculate Stress',
                          style: TextStyle(color: Colors.white),
                        ),
                        iconData: Icons.health_and_safety_rounded,
                        color: Colors.green,
                        onPressed: _calculateStress,
                      ),
                    ),
              const SizedBox(height: 20),
              StressBlock(value: stressValue.toString()),
              const SizedBox(height: 10),
              HeartRateBlock(
                minRate: minRate,
                maxRate: maxRate,
                averageBpm: averageBpm,
                heartRateValue: heartRateValue,
              ),
              MySleepBlock(sleepDurationInHours: sleep),
              TempBlock(
                tempValue: tempValue,
                maxTemp: maxTemp,
                minTemp: minTemp,
              ),
              MyCircleComponent(
                hoursList: hours,
              ),
              // const Mytextblock(),
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
      final List<List<dynamic>> csvData = const csv.CsvToListConverter()
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
    List<String> numbers = ContactManager.contacts
        .map((contact) => contact['number'] ?? '')
        .toList();
    print(numbers);
    setState(() {
      isLoading = true;
    });

    final csvData = await readCsvFromAssets('x_test.csv');
    final csvDataOriginal = await readCsvFromAssets('x_test_original.csv');

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

    var originalRow = csvDataOriginal[randomIndex].sublist(1);
    sleep = originalRow[6];
    // Generate random hours for each day
    hours = List.generate(7, (index) => generateRandomNumber(2, 8));
    //Heart Rate
    // Generate random values for min, max, and average heart rates
    minRate = generateRandomNumber(50, 70);
    maxRate = generateRandomNumber(100, 120);
    averageBpm = (minRate + maxRate) ~/ 2;

    heartRateValue = originalRow[7].toInt();

    //Body Temperature
    // Generate random values for min, max, and average body temperature
    Random random = Random();

    // Generate a random double value in the specified range
    minTemp = 35 + random.nextDouble();
    maxTemp = 37 + random.nextDouble();
    tempValue = ((originalRow[2] - 32.0) * 5.0 / 9.0);
    if (tempValue < 35 || tempValue > 38) {
      // If tempValue temperature is outside the range [35, 38]
      // Generate a random value within the range and use it
      tempValue = Random().nextDouble() * (38 - 35) + 35;
    }
    // snoring rate,respiration rate,body temperature,limb movement,blood oxygen,eye movement,sleeping hours,heart rate
    print(originalRow);
    if (stressValue > 79 && await Permission.sms.request().isGranted) {
      for (String number in numbers) {
        smsFunction(
          message:
              "Friendly Reminder from BalenceBeats. Please check on ${widget.username} as person might be a little sad today. You can help him by talking to him. Thank you.",
          number: number,
        );
      }
    } else {
      final status = await Permission.sms.request();
      if (stressValue > 79 && status.isGranted) {
        for (String number in numbers) {
          smsFunction(
            message:
                "Friendly Reminder from BalenceBeats. Please check on ${widget.username} as personHe might be a little sad today. You can help him by talking to him. Thank you.",
            number: number,
          );
        }
      }
    }
    Timer(const Duration(seconds: 3), () {
      // Set isLoading to false after 3 seconds to stop the loading animation
      setState(() {
        isLoading = false;
      });
    });
  }
}
