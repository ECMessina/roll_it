import 'package:flutter/material.dart';
import 'package:roll_it/dice_count.dart';
import 'package:roll_it/gradient_container.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[100],
          title: const Text('Dice Count:'),
          actions: const [
            DiceCount(),
          ],
        ),
        body: GradientContainer(
          [
            Colors.green,
            Colors.green[100]!,
          ],
        ),
      ),
    );
  }
}
