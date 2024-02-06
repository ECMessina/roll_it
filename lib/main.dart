import 'package:flutter/material.dart';
import 'package:roll_it/dice_count.dart';
import 'package:roll_it/gradient_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roll_it/providers/shared_preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MainApp(),
    ),
  );
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
          actions: [
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
