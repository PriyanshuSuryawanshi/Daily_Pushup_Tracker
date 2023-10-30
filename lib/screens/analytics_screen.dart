import 'package:daily_pushup_tracker/database/pushupdata.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart'; // Import intl package

class AnalyticsScreen extends StatefulWidget {
  @override
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  List<PushupData> pushupDataList = [];
  List<DateTime> dateList = [];
  List<int> countList = [];

  @override
  void initState() {
    super.initState();
    loadDataFromDatabase();
  }

  Future<void> loadDataFromDatabase() async {
    final boxPushups = await Hive.openBox<PushupData>('pushupBox');
    final data = boxPushups.values.toList();
    setState(() {
      pushupDataList = data;
    });
    for (final pushupData in pushupDataList) {
      dateList.add(pushupData.date);
      countList.add(pushupData.count);
    }
    if (dateList.length > 7) {
      dateList = dateList.sublist(dateList.length - 7);
      countList = countList.sublist(countList.length - 7);
    }
    print('Dates :- ');
    print(dateList);
    print('Count :- ');
    print(countList);
    // print('Date: ${pushupData.date}, Count: ${pushupData.count}');
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          'Analytics Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(15),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xff37434d),
              width: 1.0,
            ),
          ),
        ),
        child: SizedBox(
          height: screenSize.height * 0.4,
          width: screenSize.width * 0.8,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: const FlTitlesData(show: false),
              minX: 0,
              maxX: dateList.length - 1,
              minY: 0,
              maxY: 150,
              lineBarsData: [
                LineChartBarData(
                  spots: countList
                      .asMap()
                      .entries
                      .map((entry) =>
                          FlSpot(entry.key.toDouble(), entry.value.toDouble()))
                      .toList(),
                  isCurved: true,
                  color: Colors.blue,
                  dotData: const FlDotData(show: false),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
