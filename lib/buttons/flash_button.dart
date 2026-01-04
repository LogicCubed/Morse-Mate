import 'package:flutter/material.dart';
import 'package:morse_mate/morse_service.dart';

class FlashButton extends StatelessWidget {
  final MorseService morseService;
  final String morseText;

  const FlashButton({
    super.key,
    required this.morseService,
    required this.morseText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            morseService.flashMorse(morseText);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 44, 42, 50),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.lightbulb,
                color: Colors.white,
              ),
              SizedBox(width: 8),
              Text(
                'FLASH',
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