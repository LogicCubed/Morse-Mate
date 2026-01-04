import 'package:flutter/foundation.dart';
import 'morse_service.dart';

class MorseController extends ChangeNotifier {
  final MorseService _service = MorseService();

  String _inputText = '';
  String _morseOutput = '';

  String get inputText => _inputText;
  String get morseOutput => _morseOutput;

  void setInputText(String text) {
    _inputText = text;
    _morseOutput = _service.textToMorse(_inputText);
    notifyListeners(); // Notifies UI to rebuild
  }

  void clear() {
    _inputText = '';
    _morseOutput = '';
    notifyListeners();
  }
}