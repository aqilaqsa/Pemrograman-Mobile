// lib/widgets/anime_thumbnail.dart
import 'package:flutter/material.dart';

class AnimeThumbnail extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onClick;

  const AnimeThumbnail({super.key, required this.imagePath, required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        children: [
          Container(
            width: 165,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
