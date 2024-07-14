import 'package:flutter/material.dart';
import 'navigation_bar.dart';
import 'highlight_content.dart';
import 'anime_thumbnail.dart';
import 'genres_container.dart';
import 'anime_detail.dart';

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
      home: const AniflixHomePage(),
    );
  }
}

class AniflixHomePage extends StatefulWidget {
  const AniflixHomePage({super.key});

  @override
  State<AniflixHomePage> createState() => _AniflixHomePageState();
}

class _AniflixHomePageState extends State<AniflixHomePage> {
  String selectedGenre = "";
  String _highlightImagePath = 'assets/images/highlight.jpg';
  List<Map<String, dynamic>> searchResults = [];
  bool isSearching = false;

  final List<Map<String, dynamic>> animeDetails = [
    {
      'imagePath': 'assets/images/anime1.jpg',
      'title': 'Solo Leveling',
      'genres': ['Action', 'Drama', 'Fantasy', 'OP'],
      'description':
          'Solo Leveling (俺だけレベルアップな件, Ore dake Reberu Appu na Ken) is the anime adaptation of Chu-Gong Solo Leveling webnovel and the accompanying webtoon series. The series, brought to life by A-1 Pictures, made its debut in 2024.',
      'episodes': List.generate(12, (index) => 'Episode ${index + 1}'),
    },
    {
      'imagePath': 'assets/images/anime2.jpg',
      'title': 'Hunter X Hunter (2011 Ver.)',
      'genres': ['Action', 'Fantasy'],
      'description':
          'Hunter × Hunter (ハンター×ハンター, Hantā Hantā), pronounced "Hunter Hunter", is a Japanese manga series written and illustrated by Yoshihiro Togashi.',
      'episodes': List.generate(148, (index) => 'Episode ${index + 1}'),
    },
    {
      'imagePath': 'assets/images/anime3.jpg',
      'title': 'Mashle S2',
      'genres': ['Comedy', 'Action', 'OP', 'Fantasy'],
      'description':
          'Mashle (マッシュル-MASHLE-) is a Japanese anime series based on the Mashle manga by Hajime Komoto. The anime premiered in April 2023. The second season is titled Mashle: Divine Visionary Candidate Exam Arc',
      'episodes': List.generate(12, (index) => 'Episode ${index + 1}'),
    },
    {
      'imagePath': 'assets/images/anime4.jpg',
      'title': 'One Piece',
      'genres': ['Adventure', 'Action'],
      'description':
          'One Piece (ワンピース, Wan Pīsu?) is an animated series based on the manga produced by Toei Animation and broadcasted by Fuji Television. Premiering in October 1999, it has currently aired over 1000 episodes and been exported to more than thirty nations worldwide.',
      'episodes': List.generate(10, (index) => 'Episode ${index + 1}'),
    },
    {
      'imagePath': 'assets/images/anime5.jpg',
      'title': 'Naruto',
      'genres': ['Action', 'Adventure', 'Comedy', 'Fantasy'],
      'description':
          'Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, a young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village. ',
      'episodes': List.generate(12, (index) => 'Episode ${index + 1}'),
    },
    {
      'imagePath': 'assets/images/anime6.jpg',
      'title': 'Angel Beats!',
      'genres': ['Drama', 'Romance', 'Fantasy'],
      'description':
          'Angel Beats! is a 13-episode Japanese anime television series produced by P.A. Works and Aniplex directed by Seiji Kishi. The story was conceived by Jun Maeda, with original character design by Na-Ga; both Maeda and Na-Ga are from the visual novel brand Key, who produced such titles as Kanon, Air, and Clannad.',
      'episodes': List.generate(13, (index) => 'Episode ${index + 1}'),
    },
    {
      'imagePath': 'assets/images/anime7.jpg',
      'title': 'Tokyo Ghoul',
      'genres': ['Thriller', 'Horror', 'Drama'],
      'description':
          'A 12-episode anime television series adaptation produced by Pierrot, aired on Tokyo MX from July to September 2014. Tokyo Ghoul (Japanese: 東京喰種トーキョーグール, Hepburn: Tōkyō Gūru) is a Japanese dark fantasy manga series written and illustrated by Sui Ishida.',
      'episodes': List.generate(12, (index) => 'Episode ${index + 1}'),
    },
  ];

  final List<String> _genres = [
    'Action',
    'OP',
    'Thriller',
    'Fantasy',
    'Comedy',
    'Drama',
    'Romance',
    'Horror'
  ];

  void _toggleHighlightImage() {
    setState(() {
      _highlightImagePath = _highlightImagePath == 'assets/images/highlight.jpg'
          ? 'assets/images/light.jpg'
          : 'assets/images/highlight.jpg';
    });
  }

  void _handleGenreSelected(String genre) {
    setState(() {
      selectedGenre = genre;
    });
  }

  void _searchAnime(String query) {
    setState(() {
      if (query.isEmpty) {
        searchResults = [];
        isSearching = false;
      } else {
        searchResults = animeDetails.where((anime) {
          return anime['title'].toLowerCase().contains(query.toLowerCase());
        }).toList();
        isSearching = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> displayAnime = isSearching
        ? searchResults
        : (selectedGenre.isEmpty
            ? animeDetails
            : animeDetails
                .where((anime) => anime['genres'].contains(selectedGenre))
                .toList());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomNavigationBar(
          onSearch: _searchAnime,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HighlightContent(
              imagePath: _highlightImagePath,
              title: 'ANIFLIX',
              onPress: _toggleHighlightImage,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GenresContainer(
                  genres: _genres, onGenreSelected: _handleGenreSelected),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: displayAnime.isEmpty
                  ? const Center(
                      child: Text('No results found',
                          style: TextStyle(color: Colors.white, fontSize: 18)))
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: (100 / 150),
                      ),
                      itemCount: displayAnime.length,
                      itemBuilder: (context, index) {
                        final anime = displayAnime[index];
                        return AnimeThumbnail(
                          imagePath: anime['imagePath'],
                          title: anime['title'],
                          onClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AnimeDetailPage(
                                  title: anime['title'],
                                  imagePath: anime['imagePath'],
                                  description: anime['description'],
                                  episodes: anime['episodes'],
                                ),
                              ),
                            );
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
