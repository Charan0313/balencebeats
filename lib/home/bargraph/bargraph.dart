import 'package:balencebeats/home/bargraph/bardata.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MybarGraph extends StatelessWidget {
  final List values;
  const MybarGraph({super.key, required this.values});
  final Color customColor = const Color.fromRGBO(154, 158, 239, 1);
  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        value1: values[0],
        value2: values[1],
        value3: values[2],
        value4: values[3],
        value5: values[4]);
    myBarData.intitalisedBarData();
    return BarChart(BarChartData(
        maxY: 100,
        minY: 0,
        titlesData: const FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true,getTitlesWidget: GetBottomTiles,),),
        ),
        gridData: const FlGridData(show: false),
        barGroups: myBarData.barData
            .map((data) => BarChartGroupData(x: data.x, barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color: customColor,
                      width: 15,
                      borderRadius: BorderRadius.circular(2),
                      backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: 100,
                          color: const Color.fromARGB(255, 195, 195, 195)))
                ]))
            .toList()));
  }
}

Widget GetBottomTiles(double value, TitleMeta meta) {
  const style =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12);

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(' S', style: style);
      break;
    case 1:
      text = const Text('M', style: style);
      break;
    case 2:
      text = const Text('T', style: style);
      break;
    case 3:
      text = const Text('W', style: style);
      break;
    case 4:
      text = const Text('T', style: style);
      break;
    case 5:
      text = const Text('F', style: style);
      break;
    default:
      text = const Text('S', style: style);
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
