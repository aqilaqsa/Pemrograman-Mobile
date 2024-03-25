import 'package:flutter/material.dart';
import 'navigation_bar.dart';
import 'highlight_content.dart';
import 'anime_thumbnail.dart';
import 'genres_container.dart';

void main() {
  runApp(const AniflixApp());
}

class AniflixApp extends StatelessWidget {
  const AniflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aniflix',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AniflixHomePage(),
    );
  }
}

class AniflixHomePage extends StatelessWidget {
  // Updated dummy data to simulate anime titles along with thumbnails
  final List<Map<String, String>> _animeThumbnails = [
    {'imagePath': 'assets/images/anime1.jpg', 'title': 'Solo Leveling'},
    {'imagePath': 'assets/images/anime2.jpg', 'title': 'Hunter X Hunter (2011 Ver.)'},
    {'imagePath': 'assets/images/anime3.jpg', 'title': 'Mashle'},
    {'imagePath': 'assets/images/anime4.jpg', 'title': 'One Piece'},
    {'imagePath': 'assets/images/anime5.jpg', 'title': 'Naruto'},
  ];

  final List<String> _genres = ['Action', 'Adventure', 'Comedy', 'Drama'];

  AniflixHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomNavigationBar(
          onSearch: (query) {
            // Future implementation of search functionality
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HighlightContent(imagePath: 'assets/images/highlight.jpg', title: 'ANIFLIX'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GenresContainer(genres: _genres),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // to disable GridView's scrolling inside a SingleChildScrollView
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 8.0, // Horizontal space between items
                  mainAxisSpacing: 8.0, // Vertical space between items
                  childAspectRatio: (100 / 150), // Aspect ratio of each item
                ),
                itemCount: _animeThumbnails.length,
                itemBuilder: (context, index) {
                  var anime = _animeThumbnails[index];
                  return AnimeThumbnail(
                    imagePath: anime['imagePath']!,
                    title: anime['title']!,
                    onClick: () {
                      // Implement onClick functionality, e.g., navigate to a detail page
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
