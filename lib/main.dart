import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  int multiplier = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 250),
          const Text(
            'Today\'s Push Ups :',
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
                  onPressed: () => subtractPushup(multiplier),
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  )),
              const SizedBox(
                width: 50,
              ),
              ElevatedButton(
                  onPressed: () => addPushup(multiplier),
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
}
