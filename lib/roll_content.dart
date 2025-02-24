import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roll_it/providers/dice_count_provider.dart';
import 'package:roll_it/roll_button.dart';

class RollContent extends ConsumerStatefulWidget {
  const RollContent({super.key});

  @override
  ConsumerState<RollContent> createState() => _RollContentState();
}

class _RollContentState extends ConsumerState<RollContent> {
  List<int> currentRolls = [];

  void rollIt() async {
    final timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      setState(() {
        updateDice();
      });
    });

    final player = AudioPlayer();
    player.onPlayerComplete.listen((event) {
      timer.cancel();
    });

    await player.play(AssetSource('dice-142528.mp3'));
  }

  @override
  void initState() {
    getNewDice();
    super.initState();
  }

  void getNewDice() {
    for (int i = 0; i < 6; i++) {
      currentRolls.add(Random().nextInt(6) + 1);
    }
  }

  void updateDice() {
    for (int i = 0; i < 6; i++) {
      currentRolls[i] = Random().nextInt(6) + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.45;

    final count = ref.watch(diceCountProvider) + 1;

    return Column(
      children: [
        const Spacer(),
        Column(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              children: List.generate(
                count,
                (index) => Image.asset(
                  'assets/images/dice-${currentRolls[index]}.png',
                  width: screenWidth,
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        RollButton(onPressed: rollIt),
      ],
    );
  }
}
