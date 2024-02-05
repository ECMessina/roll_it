import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roll_it/dice_count_provider.dart';

class RollContent extends ConsumerStatefulWidget {
  const RollContent({super.key});

  @override
  ConsumerState<RollContent> createState() => _RollContentState();
}

class _RollContentState extends ConsumerState<RollContent> {
  int currentRoll = 1;

  void rollIt() async {
    final player = AudioPlayer();
    player.onPlayerComplete.listen((event) {
      setState(() {
        currentRoll = Random().nextInt(6) + 1;
      });
      debugPrint('done');
    });
    await player.play(AssetSource('dice-142528.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    final count = ref.watch(diceCountProvider) + 1;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(
          spacing: 24,
          runSpacing: 24,
          children: List.generate(
            count,
            (index) => Image.asset(
              'assets/images/dice-$currentRoll.png',
              height: 150,
              width: 150,
            ),
          ),
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
