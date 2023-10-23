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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
          const SizedBox(height: 50),
          Text(
            '$count',
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: subtractPushup,
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  )),
              const SizedBox(
                width: 50,
              ),
              ElevatedButton(
                  onPressed: addPushup,
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

  addPushup() {
    count += 1;
    setState(() {});
  }

  subtractPushup() {
    if (count > 0) {
      count -= 1;
    }
    setState(() {});
  }
}
