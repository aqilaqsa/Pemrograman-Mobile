import 'package:flutter/material.dart';

class AnimeDetailPage extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;
  final List<String> episodes;

  const AnimeDetailPage({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.episodes,
  });

  @override
  Widget build(BuildContext context) {
    Color descriptionBoxColor =
        const Color.fromARGB(255, 13, 52, 111).withOpacity(0.8);

    return Scaffold(
      appBar: AppBar(
        title: Text(title,
            style: const TextStyle(
                fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Image.asset(imagePath,
                  width: MediaQuery.of(context).size.width * 0.8),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: descriptionBoxColor,
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Episodes list:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ...episodes.map((episode) => Text(episode)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
