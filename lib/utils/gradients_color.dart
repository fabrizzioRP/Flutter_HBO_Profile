import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientColors {
  static Gradient firstColorsGradient = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [0.11, 1.0],
    colors: [
      Colors.black,
      Colors.pink,
    ],
  );

  static Gradient secondColorsGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
    stops: const [0.4, 0.9],
    colors: [
      Colors.black,
      Colors.blue.shade800,
    ],
  );

  static Gradient thirdColorsGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.4, 0.8],
    colors: [
      Colors.black,
      Colors.purple,
    ],
  );

  static Gradient fourColorsGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomLeft,
    stops: const [0.3, 0.8],
    colors: [
      Colors.black,
      Colors.red.shade800,
    ],
  );
}

final primaryColor = Colors.white;

final List<Gradient> coloresBackground = [
  GradientColors.firstColorsGradient,
  GradientColors.secondColorsGradient,
  GradientColors.thirdColorsGradient,
  GradientColors.fourColorsGradient,
];
