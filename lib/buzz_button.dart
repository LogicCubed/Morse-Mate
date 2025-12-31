import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class BuzzButton extends StatelessWidget {
  const BuzzButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // TODO: Buzz Feature
            Vibration.vibrate(duration: 200);
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
                Icons.vibration,
                color: Colors.white,
              ),
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