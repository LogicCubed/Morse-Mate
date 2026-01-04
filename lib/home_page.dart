import 'package:flutter/material.dart';
import 'package:morse_mate/buttons/beep_button.dart';
import 'package:morse_mate/buttons/buzz_button.dart';
import 'package:morse_mate/input.dart';
import 'package:morse_mate/output.dart';
import 'buttons/flash_button.dart';
import 'header.dart';
import 'morse_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MorseService morseService = MorseService();
  final TextEditingController inputController = TextEditingController();
  String morseOutput = '';

  void convertText() {
    setState(() {
      morseOutput = morseService.textToMorse(inputController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 24, 23, 27),
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Input(controller: inputController, onChanged: (_) => convertText()),
            Output(text: morseOutput),
            const Expanded(child: SizedBox()),
            BeepButton(
              morseService: morseService,
              morseText: morseOutput,
            ),
            BuzzButton(
              morseService: morseService,
              morseText: morseOutput,
            ),
            const FlashButton(),
          ],
        ),
      ),
    );
  }
}