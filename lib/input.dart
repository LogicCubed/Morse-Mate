import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const Input({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Enter Text...',
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: const Color.fromARGB(255, 44, 42, 50),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        maxLines: 1,
      ),
    );
  }
}