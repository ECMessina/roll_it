import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roll_it/constants.dart';
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
    'Six',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownMenu<String>(
      initialSelection: numOfDice[ref.read(diceCountProvider)],
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.backgroundColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      textStyle: AppTextStyles.appBarTextStyle,
      onSelected: (String? value) async {
        final savedCount = numOfDice.indexOf(value!);
        final prefs = ref.read(sharedPreferencesProvider);
        await prefs.setInt('Saved Count', savedCount);
        ref.read(diceCountProvider.notifier).updateDiceCount(savedCount);
      },
      dropdownMenuEntries:
          numOfDice.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(
              value: value,
              label: value,
              labelWidget: Text(value, style: AppTextStyles.appBarTextStyle),
              style: ButtonStyle(
                overlayColor: WidgetStatePropertyAll(AppColors.focusedColor),
                backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                  Set<WidgetState> states,
                ) {
                  if (states.contains(WidgetState.focused)) {
                    return AppColors.focusedColor;
                  }
                  return Colors.transparent;
                }),
              ),
            );
          }).toList(),
    );
  }
}
