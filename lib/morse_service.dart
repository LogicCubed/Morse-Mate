import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:vibration/vibration.dart';

class MorseService {
  static const Map<String, String> _morseMap = {
    'A': '.-',
    'B': '-...',
    'C': '-.-.',
    'D': '-..',
    'E': '.',
    'F': '..-.',
    'G': '--.',
    'H': '....',
    'I': '..',
    'J': '.---',
    'K': '-.-',
    'L': '.-..',
    'M': '--',
    'N': '-.',
    'O': '---',
    'P': '.--.',
    'Q': '--.-',
    'R': '.-.',
    'S': '...',
    'T': '-',
    'U': '..-',
    'V': '...-',
    'W': '.--',
    'X': '-..-',
    'Y': '-.--',
    'Z': '--..',
    '1': '.----',
    '2': '..---',
    '3': '...--',
    '4': '....-',
    '5': '.....',
    '6': '-....',
    '7': '--...',
    '8': '---..',
    '9': '----.',
    '0': '-----',
  };

  static const int dot = 150;
  static const int dash = dot * 3;
  static const int symbolGap = dot;
  static const int letterGap = dot * 3;
  static const int wordGap = dot * 7;


  String textToMorse(String text) {
    return text
        .toUpperCase()
        .trim()
        .split(' ')
        .map((word) => word
            .split('')
            .map((c) => _morseMap[c] ?? '')
            .where((c) => c.isNotEmpty)
            .join(' '))
        .join(' / ');
  }

    final AudioPlayer _player = AudioPlayer()
    ..setReleaseMode(ReleaseMode.stop);

  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) return;
    await _player.setSource(AssetSource('sounds/beep.wav'));
    _initialized = true;
  }

  Future<void> beepMorse(String morse) async {
    await init();

    for (final char in morse.split('')) {
      switch (char) {
        case '.':
          await _player.resume();
          await Future.delayed(const Duration(milliseconds: dot));
          await _player.stop();
          await Future.delayed(const Duration(milliseconds: symbolGap));
          break;

        case '-':
          await _player.resume();
          await Future.delayed(const Duration(milliseconds: dash));
          await _player.stop();
          await Future.delayed(const Duration(milliseconds: symbolGap));
          break;

        case ' ':
          await Future.delayed(const Duration(milliseconds: letterGap));
          break;

        case '/':
          await Future.delayed(const Duration(milliseconds: wordGap));
          break;
      }
    }
  }

  Future<void> vibrateMorse(String morse) async {
    const int amplitude = 255;

    for (final char in morse.split('')) {
      switch (char) {
        case '.':
          await Vibration.vibrate(duration: dot, amplitude: amplitude);
          await Future.delayed(const Duration(milliseconds: symbolGap));
          break;
        case '-':
          await Vibration.vibrate(duration: dash, amplitude: amplitude);
          await Future.delayed(const Duration(milliseconds: symbolGap));
          break;
        case ' ':
          await Future.delayed(const Duration(milliseconds: letterGap));
          break;
        case '/':
          await Future.delayed(const Duration(milliseconds: wordGap));
          break;
      }
    }
  }
}