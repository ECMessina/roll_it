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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 24.0,
              mainAxisSpacing: 24.0,
            ),
            itemCount: ref.watch(diceCountProvider) + 1,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                'assets/images/dice-$currentRoll.png',
              );
            },
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
