import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  final Function(String) onSearch;

  const CustomNavigationBar({super.key, required this.onSearch});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _handleSearch() {
    if (_controller.text.trim().isEmpty) {
      //input empty!!
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a search term'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        )
      );
    } else {
      widget.onSearch(_controller.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: TextField(
        controller: _controller,
        onSubmitted: (value) {
          _handleSearch();
        },
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Search anime titles...",
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _controller.clear();
              widget.onSearch('');
            },
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: _handleSearch,
          color: _controller.text.isEmpty ? Colors.grey : Colors.white,
        ),
      ],
    );
  }
}
