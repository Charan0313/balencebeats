import 'package:balencebeats/home/bargraph/individualbar.dart';

class BarData {
  final double value1;
  final double value2;
  final double value3;
  final double value4;
  final double value5;

  BarData({
    required this.value1,
    required this.value2,
    required this.value3,
    required this.value4,
    required this.value5,
  });

  List<IndividualBar> barData = [];
  void intitalisedBarData() {
    barData = [
      IndividualBar(x: 1, y: value1),
      IndividualBar(x: 2, y: value2),
      IndividualBar(x: 3, y: value3),
      IndividualBar(x: 4, y: value4),
      IndividualBar(x: 5, y: value5),
    ];
  }
}
