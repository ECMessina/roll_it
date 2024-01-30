import 'dart:math';
import 'package:flutter/material.dart';

class RollContent extends StatefulWidget {
  const RollContent({super.key});

  @override
  State<RollContent> createState() => _RollContentState();
}

class _RollContentState extends State<RollContent> {
  int currentRoll = 1;

  void rollIt() {
    setState(() {
      currentRoll = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/dice-$currentRoll.png',
          width: 100,
          height: 100,
        ),
        TextButton(
          onPressed: rollIt,
          child: const Text(
            'Roll it!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
