import 'package:flutter/material.dart';

class DiceCount extends StatefulWidget {
  const DiceCount({super.key});

  @override
  State<DiceCount> createState() => _DiceCountState();
}

List<String> numOfDice = <String>[
  'One',
  'Two',
  'Three',
  'Four',
  'Five',
  'Six'
];

class _DiceCountState extends State<DiceCount> {
  String dropdownValue = numOfDice.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: numOfDice.first,
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: numOfDice.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
