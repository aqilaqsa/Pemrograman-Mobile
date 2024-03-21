import 'package:app_from_scratch/styled_text.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors, {super.key});

  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
        ),
      ),
      child: Center(
        // child: StyledText("HIKS")
        child: Image.asset(
          'assets/images/dice-images/dice-1.png',
          width: 200,
          ),
        ),
    );
  }
}
