import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roll_it/providers/dice_count_provider.dart';
import 'package:roll_it/providers/shared_preferences_provider.dart';

class DiceCount extends ConsumerWidget {
  DiceCount({super.key});

  final List<String> numOfDice = <String>[
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six'
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownMenu<String>(
      initialSelection: numOfDice[ref.read(diceCountProvider)],
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      onSelected: (String? value) async {
        final savedCount = numOfDice.indexOf(value!);
        final prefs = ref.read(sharedPreferencesProvider);
        await prefs.setInt('Saved Count', savedCount);
        ref.read(diceCountProvider.notifier).state = savedCount;
      },
      dropdownMenuEntries: numOfDice.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
