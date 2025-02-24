import 'package:flutter/material.dart';
import 'package:roll_it/constants.dart';

class RollButton extends StatelessWidget {
  const RollButton({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.33;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            AppColors.darkerGradientColor,
          ),
          padding: WidgetStatePropertyAll(
            EdgeInsets.only(left: screenWidth, right: screenWidth),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          shadowColor: WidgetStatePropertyAll(AppColors.buttonShadowColor),
          elevation: WidgetStatePropertyAll(20),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Roll it!', style: AppTextStyles.buttonTextStyle),
        ),
      ),
    );
  }
}
