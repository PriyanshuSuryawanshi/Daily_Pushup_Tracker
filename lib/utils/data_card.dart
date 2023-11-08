import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PushUpDataCard extends StatelessWidget {
  final DateTime date;
  final int count;

  const PushUpDataCard({Key? key, required this.date, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('d MMM').format(date);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$formattedDate :',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    count.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
