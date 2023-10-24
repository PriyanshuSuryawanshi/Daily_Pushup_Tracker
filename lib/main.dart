import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
  double completionPercent = 0;
  bool targetComplete = false;
  final TextEditingController _textController =
      TextEditingController(text: '10');

  final confettiController = ConfettiController();
  @override
  void dispose() {
    super.dispose();
    confettiController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: [
      Scaffold(
        backgroundColor: Colors.black87,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const SizedBox(height: 25),
            // SETTINGS ICON
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
            const SizedBox(height: 50),
            Text(
              'Daily Target : $dailyTarget',
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.white70),
            ),
            const SizedBox(height: 25),

            // PROGRESSBAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: LinearPercentIndicator(
                animation: true,
                animateFromLastPercent: true,
                animationDuration: 250,
                barRadius: const Radius.circular(5),
                lineHeight: 12.0,
                percent: completionPercent,
                backgroundColor: Colors.white70,
                progressColor: Colors.deepOrange.shade800,
              ),
            ),
            // TARGET ACHIEVED
            const SizedBox(height: 15),
            targetComplete
                ? const Text(
                    'Target Acheived! 💪🏻',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white70),
                  )
                : const Text('',
                    style: TextStyle(
                      fontSize: 20,
                    )),
            const SizedBox(height: 60),
            const Text(
              'Today\'s Push Ups',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white70),
            ),
            const SizedBox(height: 40),

            // CURRENT PUSHUPs COUNT
            targetComplete
                ? Text(
                    '$count🔥',
                    style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70),
                  )
                : Text(
                    '$count',
                    style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70),
                  ),
            const SizedBox(height: 20),

            // Set SETSIZE
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
            const SizedBox(height: 30),

            // INCREASE & DECREASE COUNTER
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => subtractPushup(setSize),
                    child: const Text(
                      '-',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                    )),
                const SizedBox(
                  width: 60,
                ),
                ElevatedButton(
                    onPressed: () => addPushup(setSize),
                    child: const Text(
                      '+',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                    )),
              ],
            ),
          ],
        ),
      ),
      ConfettiWidget(
        gravity: 0.01,
        confettiController: confettiController,
        blastDirection: pi / 2,
        numberOfParticles: 20,
      ),
    ]);
  }

  // METHODS

  void addPushup(int val) {
    count += val;
    completionPercent = count / dailyTarget;
    if (completionPercent >= 1) {
      completionPercent = 1;
      targetComplete = true;
    }
    if (count == dailyTarget) {
      celebrate();
    }
    setState(() {});
  }

  void subtractPushup(int val) {
    if (count > 0) {
      count -= val;
    }
    if (count < 0) {
      count = 0;
    }
    completionPercent = count / dailyTarget;
    if (completionPercent >= 1) {
      completionPercent = 1;
    } else {
      targetComplete = false;
    }
    setState(() {});
  }

  updateSetSize() {
    // ignore: prefer_is_empty
    if (_textController.text.length > 0) {
      int val = int.parse(_textController.text);
      setSize = val;
      setState(() {});
    }
  }

  celebrate() async {
    confettiController.play();
    await Future.delayed(Duration(seconds: 2));
    confettiController.stop();
  }
}
