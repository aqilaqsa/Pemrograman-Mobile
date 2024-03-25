// lib/widgets/highlight_content.dart
import 'package:flutter/material.dart';

class HighlightContent extends StatelessWidget {
  final String imagePath;
  final String title;

  const HighlightContent({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
          color: Color.fromARGB(255, 254, 254, 255), 
          fontSize: 40,
          fontFamily: 'BebasNeue',
          fontWeight: FontWeight.bold)
        ),
      ),
    );
  }
}
