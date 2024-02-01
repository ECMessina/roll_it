import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roll_it/dice_count_provider.dart';

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
      onSelected: (String? value) {
        ref.read(diceCountProvider.notifier).state = numOfDice.indexOf(value!);
      },
      dropdownMenuEntries: numOfDice.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
