import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final VoidCallback onSettingsPressed;

  const Header({
    super.key,
    required this.title,
    required this.onSettingsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: onSettingsPressed,
          ),
        ],
      ),
    );
  }
}