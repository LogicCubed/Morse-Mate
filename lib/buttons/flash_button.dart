import 'package:flutter/material.dart';
import 'package:morse_mate/morse_service.dart';

class FlashButton extends StatefulWidget {
  final MorseService morseService;
  final String morseText;
  final bool loop;

  const FlashButton({
    super.key,
    required this.morseService,
    required this.morseText,
    this.loop = false,
  });

  @override
  State<FlashButton> createState() => _FlashButtonState();
}

class _FlashButtonState extends State<FlashButton> {
  bool _isPlaying = false;

  Future<void> flashMorse() async {
    if (_isPlaying || widget.morseText.isEmpty) return;
    setState(() => _isPlaying = true);

    await widget.morseService.flashMorse(widget.morseText);

    setState(() => _isPlaying = false);

    if (widget.loop) {
      await Future.delayed(const Duration(milliseconds: 1500));
      flashMorse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: flashMorse,
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
            children: [
              Icon(
                Icons.lightbulb,
                color: _isPlaying
                  ? const Color.fromARGB(255, 111, 255, 89)
                  : Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                _isPlaying ? 'PLAYING...' : 'BEEP',
                style: TextStyle(
                  color: _isPlaying
                    ? const Color.fromARGB(255, 111, 255, 89)
                    : Colors.white,
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