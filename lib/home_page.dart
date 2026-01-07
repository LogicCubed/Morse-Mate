import 'package:flutter/material.dart';
import 'package:morse_mate/buttons/loop_button.dart';
import 'package:morse_mate/buttons/stop_button.dart';
import 'package:morse_mate/buttons/beep_button.dart';
import 'package:morse_mate/buttons/buzz_button.dart';
import 'package:morse_mate/buttons/flash_button.dart';
import 'package:morse_mate/input.dart';
import 'package:morse_mate/output.dart';
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

  bool isLooping = false;

  void convertText() {
    setState(() {
      morseOutput = morseService.textToMorse(inputController.text);
    });
  }

  void toggleLoop(bool value) {
    setState(() => isLooping = value);
  }

  void stopAll() {
    setState(() {
      isLooping = false;
    });
    morseService.stopAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 24, 23, 27),
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Header(),
              Input(controller: inputController, onChanged: (_) => convertText()),
              Output(text: morseOutput),
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LoopButton(
                      isLooping: isLooping,
                      onToggle: toggleLoop,
                    ),
                    StopButton(
                      onStop: () {
                        stopAll();
                      },
                    ),
                  ],
                ),
              ),
              BeepButton(
                morseService: morseService,
                morseText: morseOutput,
                loop: isLooping,
              ),
              BuzzButton(
                morseService: morseService,
                morseText: morseOutput,
                loop: isLooping,
              ),
              FlashButton(
                morseService: morseService,
                morseText: morseOutput,
                loop: isLooping,
              ),
            ],
          ),
        ),
      ),
    );
  }
}