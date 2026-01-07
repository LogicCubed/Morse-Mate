import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:vibration/vibration.dart';
import 'package:torch_light/torch_light.dart';
import 'package:morse_mate/settings/settings.dart';

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

  bool shouldStop = false;

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
    shouldStop = false;

    for (final char in morse.split('')) {

      if (shouldStop) return;
      
      switch (char) {
        case '.':
          await _player.setVolume(Settings.beepVolume);
          await _player.resume();
          await Future.delayed(Duration(milliseconds: Settings.dotMs));
          await _player.stop();
          await Future.delayed(Duration(milliseconds: Settings.symbolGapMs));
          break;

        case '-':
          await _player.setVolume(Settings.beepVolume);
          await _player.resume();
          await Future.delayed(Duration(milliseconds: Settings.dashMs));
          await _player.stop();
          await Future.delayed(Duration(milliseconds: Settings.symbolGapMs));
          break;

        case ' ':
          await Future.delayed(Duration(milliseconds: Settings.letterGapMs));
          break;

        case '/':
          await Future.delayed(Duration(milliseconds: Settings.wordGapMs));
          break;
      }
    }
  }

  Future<void> vibrateMorse(String morse) async {
    const int amplitude = 255;
    shouldStop = false;

    for (final char in morse.split('')) {

      if (shouldStop) return;

      switch (char) {
        case '.':
          await Vibration.vibrate(
            duration: Settings.dotMs,
            amplitude: amplitude,
          );
          await Future.delayed(Duration(milliseconds: Settings.symbolGapMs));
          break;
        case '-':
          await Vibration.vibrate(
            duration: Settings.dashMs,
            amplitude: amplitude,
          );
          await Future.delayed(Duration(milliseconds: Settings.symbolGapMs));
          break;
        case ' ':
          await Future.delayed(Duration(milliseconds: Settings.letterGapMs));
          break;
        case '/':
          await Future.delayed(Duration(milliseconds: Settings.wordGapMs));
          break;
      }
    }
  }

  Future<void> flashMorse(String morse) async {
    shouldStop = false;

    for (final char in morse.split('')) {

      if (shouldStop) return;

      switch (char) {
        case '.':
          await TorchLight.enableTorch();
          await Future.delayed(Duration(milliseconds: Settings.dotMs));
          await TorchLight.disableTorch();
          await Future.delayed(Duration(milliseconds: Settings.symbolGapMs));
          break;
        case '-':
          await TorchLight.enableTorch();
          await Future.delayed(Duration(milliseconds: Settings.dashMs));
          await TorchLight.disableTorch();
          await Future.delayed(Duration(milliseconds: Settings.symbolGapMs));
          break;
        case ' ':
          await Future.delayed(Duration(milliseconds: Settings.letterGapMs));
          break;
        case '/':
          await Future.delayed(Duration(milliseconds: Settings.wordGapMs));
          break;
      }
    }
  }

  void stopAll() {
    shouldStop = true;

    _player.stop();
    Vibration.cancel();
    try { TorchLight.disableTorch(); } catch (_) {}
  }
}