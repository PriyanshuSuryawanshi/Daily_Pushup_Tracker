import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const PushUpApp());
}

class PushUpApp extends StatelessWidget {
  const PushUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Pushups Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  int setSize = 5;
  int dailyTarget = 100;
  TextEditingController _textController = TextEditingController(text: '10');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const SizedBox(height: 125),
          Text(
            'Daily Target : $dailyTarget',
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 125),
          const Text(
            'Today\'s Push Ups',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 60),
          Text(
            '$count',
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => subtractPushup(setSize),
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 50,
                  child: TextField(
                    controller: _textController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) => updateSetSize(),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () => addPushup(setSize),
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  )),
            ],
          )
        ],
      ),
    );
  }

  void addPushup(int val) {
    count += val;
    setState(() {});
  }

  void subtractPushup(int val) {
    if (count > 0) {
      count -= val;
    }
    setState(() {});
  }

  updateSetSize() {
    if (_textController.text.length > 0) {
      int val = int.parse(_textController.text);
      print('Value = ' + val.toString());
      setSize = val;
      setState(() {});
    }
  }
}
