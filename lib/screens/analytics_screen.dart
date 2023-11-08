import 'package:daily_pushup_tracker/database/pushupdata.dart';
import 'package:daily_pushup_tracker/utils/analytics_card.dart';
import 'package:daily_pushup_tracker/utils/data_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  List<PushupData> pushupDataList = [];
  List<DateTime> dateList = [];
  List<int> countList = [];
  int target = 100;

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
    // if (dateList.length > 10) {
    //   dateList = dateList.sublist(dateList.length - 10);
    //   countList = countList.sublist(countList.length - 10);
    // }
    dateList = List.from(dateList.reversed);
    countList = List.from(countList.reversed);
    // print('Dates :- ');
    // print(dateList);
    // print('Count :- ');
    // print(countList);
  }

  double maxcount() {
    double max = 0;
    for (final count in countList) {
      if (count > max) {
        max = count.toDouble();
      }
    }
    return max.toDouble();
  }

  double totalcount() {
    double total = 0;
    for (final count in countList) {
      total += count;
    }
    return total.toDouble();
  }

  double averagecount() {
    double total = totalcount() / countList.length;
    return total;
  }

  double successRate() {
    double success = 0;
    for (final count in countList) {
      if (count >= target) {
        success++;
      }
    }
    success = (success / countList.length) * 100;
    return success;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: screenSize.width,
                // height: screenSize.height * 0.4,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        AnalyticsCard(
                          displayText: 'Till Today',
                          value: totalcount(),
                        ),
                        AnalyticsCard(
                          value: maxcount(),
                          displayText: 'Highest',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        AnalyticsCard(
                          displayText: 'Average',
                          value: averagecount(),
                        ),
                        AnalyticsCard(
                          value: successRate(),
                          displayText: 'Success %',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),

            //PushUp cards

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                width: screenSize.width,
                height: screenSize.height * 0.575,
                child: (dateList.isNotEmpty)
                    ? ListView.builder(
                        itemCount: dateList.length,
                        itemBuilder: (context, index) {
                          return PushUpDataCard(
                            date: dateList[index],
                            count: countList[index],
                          );
                        },
                      )
                    : const Column(
                        children: [Text('Not Enough Data')],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
