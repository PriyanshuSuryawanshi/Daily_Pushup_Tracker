import 'package:flutter/material.dart';

void main() {
  runApp(const PushUpApp());
}

class PushUpApp extends StatelessWidget {
  const PushUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Pushups Tracker',
      darkTheme: ThemeData(
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
  int setSize = 10;
  int dailyTarget = 100;
  final TextEditingController _textController =
      TextEditingController(text: '10');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.blueGrey,
                  ),
                  iconSize: 30,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 75),
          Text(
            'Daily Target : $dailyTarget',
            style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.white70),
          ),
          const SizedBox(height: 125),
          const Text(
            'Today\'s Push Ups',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white70),
          ),
          const SizedBox(height: 60),
          Text(
            '$count',
            style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w500,
                color: Colors.white70),
          ),
          // const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Set Size : ',
                  style: TextStyle(fontSize: 20, color: Colors.white70)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 50,
                  child: TextField(
                    controller: _textController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                    onChanged: (value) => updateSetSize(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => subtractPushup(setSize),
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  )),
              const SizedBox(
                width: 60,
              ),
              ElevatedButton(
                  onPressed: () => addPushup(setSize),
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  )),
            ],
          ),
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
    if (count < 0) {
      count = 0;
    }
    setState(() {});
  }

  updateSetSize() {
    // ignore: prefer_is_empty
    if (_textController.text.length > 0) {
      int val = int.parse(_textController.text);
      // print('Value = ' + val.toString());
      setSize = val;
      setState(() {});
    }
  }
}
