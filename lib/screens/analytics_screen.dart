import 'package:daily_pushup_tracker/database/pushupdata.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart'; // Import intl package

class AnalyticsScreen extends StatefulWidget {
  @override
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  List<PushupData> pushupDataList = [];

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          'Analytics Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: pushupDataList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: pushupDataList.length,
              itemBuilder: (context, index) {
                final pushupData = pushupDataList[index];
                final formattedDate =
                    DateFormat('yyyy-MM-dd').format(pushupData.date);

                return Card(
                  color: Colors.orange,
                  child: ListTile(
                    title:
                        Text('Date: $formattedDate'), // Display formatted date
                    subtitle: Text('Count: ${pushupData.count}'),
                  ),
                );
              },
            ),
    );
  }
}
