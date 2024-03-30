import 'package:flutter/material.dart';

// belom fungsional, baru untuk menyelesaikan ketentuan minimal 3 widget

class CustomNavigationBar extends StatelessWidget {
  final Function(String)? onSearch;

  const CustomNavigationBar({super.key, this.onSearch});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: TextField(
        onSubmitted: onSearch,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }
}
