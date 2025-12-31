import 'package:flutter/material.dart';
import 'package:morse_mate/beep_button.dart';
import 'package:morse_mate/buzz_button.dart';
import 'flash_button.dart';
import 'header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 23, 27),
      body: SafeArea(
        child: Column(
          children: [
            Header(
              title: 'Morse Mate',
              onSettingsPressed: () {
                // TODO: Settings functionality
              },
            ),
            const Expanded(child: SizedBox()),
            const BeepButton(),
            const BuzzButton(),
            const FlashButton(),
          ],
        ),
      ),
    );
  }
}