import 'package:flutter/material.dart';

class GenresContainer extends StatelessWidget {
  final List<String> genres;

  const GenresContainer({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: genres.map((genre) => Chip(
            label: Text(genre, style: const TextStyle(color: Colors.white)),
            backgroundColor: genre == "Action" ?const Color.fromARGB(255, 55, 48, 133) : Colors.grey[850],
          )).toList(),
    );
  }
}
