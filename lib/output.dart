import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Output extends StatelessWidget {
  final String text;

  const Output({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: TextField(
        readOnly: true,
        controller: TextEditingController(text: text),
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Converted text will appear here...',
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: const Color.fromARGB(255, 44, 42, 50),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.copy, color: Colors.white),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: text));
            },
          ),
        ),
        maxLines: null,
      ),
    );
  }
}