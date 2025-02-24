import 'package:flutter/material.dart';
import 'package:roll_it/constants.dart';
import 'package:roll_it/dice_count.dart';
import 'package:roll_it/gradient_container.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              color: AppColors.backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Dice Count:', style: AppTextStyles.appBarTextStyle),
                  DiceCount(),
                ],
              ),
            ),
            Expanded(
              child: GradientContainer([
                AppColors.darkerGradientColor,
                AppColors.backgroundColor,
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
