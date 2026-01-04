import 'package:flutter/material.dart';
import 'package:morse_mate/morse_service.dart';

class BuzzButton extends StatelessWidget {
  final MorseService morseService;
  final String morseText;

  const BuzzButton({
    super.key,
    required this.morseService,
    required this.morseText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            morseService.vibrateMorse(morseText);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 44, 42, 50),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.vibration, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'BUZZ',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}