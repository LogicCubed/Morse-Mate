import 'package:flutter/material.dart';
import 'package:morse_mate/morse_service.dart';

class BeepButton extends StatefulWidget {
  final MorseService morseService;
  final String morseText;
  final bool loop;

  const BeepButton({
    super.key,
    required this.morseService,
    required this.morseText,
    this.loop = false,
  });

  @override
  State<BeepButton> createState() => _BeepButtonState();
}

class _BeepButtonState extends State<BeepButton> {
  bool isPlaying = false;
  bool isActiveLooping = false;

  Future<void> beepMorse() async {
    if (isPlaying || widget.morseText.isEmpty) return;

    setState(() {
      isPlaying = true;
      isActiveLooping = true;
    });

    await widget.morseService.beepMorse(widget.morseText);

    setState(() => isPlaying = false);

    if (widget.loop && mounted) {
      await Future.delayed(const Duration(milliseconds: 1500));
      if (!mounted) return;
      if (widget.loop) {
        await beepMorse();
      }
    } else {
      setState(() => isActiveLooping = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isActive = isPlaying || isActiveLooping;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: beepMorse,
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
                Icons.graphic_eq,
                color: isActive
                    ? const Color.fromARGB(255, 111, 255, 89)
                    : Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                isActive ? 'PLAYING...' : 'BEEP',
                style: TextStyle(
                  color: isActive
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