import 'package:flutter/material.dart';

class GenresContainer extends StatefulWidget {
  final List<String> genres;
  final Function(String) onGenreSelected;

  const GenresContainer(
      {super.key, required this.genres, required this.onGenreSelected});

  @override
  State<GenresContainer> createState() => _GenresContainerState();
}

class _GenresContainerState extends State<GenresContainer> {
  String? selectedGenre;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: widget.genres
          .map((genre) => ChoiceChip(
                label: Text(genre,
                    style: TextStyle(
                        color: selectedGenre == genre
                            ? Colors.black
                            : Colors.white)),
                selected: selectedGenre == genre,
                backgroundColor: Colors.grey[850],
                selectedColor: Colors.blue,
                onSelected: (bool selected) {
                  setState(() {
                    selectedGenre = selected ? genre : null;
                    widget.onGenreSelected(selectedGenre ?? "");
                  });
                },
              ))
          .toList(),
    );
  }
}
