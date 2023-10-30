import 'package:daily_pushup_tracker/database/pushupdata.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
      if (pushupData.count != 0) {
        dateList.add(pushupData.date);
        countList.add(pushupData.count);
      }
    }
    if (dateList.length > 7) {
      dateList = dateList.sublist(dateList.length - 7);
      countList = countList.sublist(countList.length - 7);
    }
    print('Dates :- ');
    print(dateList);
    print('Count :- ');
    print(countList);
  }

  double maxcount() {
    int max = 0;
    for (final count in countList) {
      if (count > max) {
        max = count;
      }
    }
    return max.toDouble();
  }

  double mincount() {
    int min = countList.isNotEmpty ? countList[0] : 0;
    for (final count in countList) {
      if (count < min) {
        min = count;
      }
    }
    return min.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.grey.shade900,
        //   title: const Text(
        //     'Analytics Screen',
        //     style: TextStyle(color: Colors.white),
        //   ),
        // ),
        backgroundColor: Colors.grey.shade900,
        body: Center(
          child: Text(
            'A - Screen',
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
