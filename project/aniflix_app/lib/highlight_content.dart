import 'package:flutter/material.dart';

class HighlightContent extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onPress;

  const HighlightContent({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onPress,
  });

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
        child: TextButton(
          onPressed: onPress,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white, // Adjust color based on your theme
              fontSize: 40,
              fontFamily: 'BebasNeue',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
