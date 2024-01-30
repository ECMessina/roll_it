import 'package:flutter/material.dart';
import 'package:roll_it/roll_content.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors, {super.key});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: const RollContent(),
    );
  }
}
