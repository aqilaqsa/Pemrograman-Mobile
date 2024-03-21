import 'package:flutter/material.dart';
import 'package:app_from_scratch/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(body: GradientContainer([
            Color.fromARGB(227, 248, 170, 225),
            Color.fromARGB(227, 71, 96, 148)
        ])),
      ),
  );
}
