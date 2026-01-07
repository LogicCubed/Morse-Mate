import 'package:flutter/material.dart';
import 'package:morse_mate/settings/settings.dart';

class SettingsSheet extends StatefulWidget {
  const SettingsSheet({super.key});

  @override
  State<SettingsSheet> createState() => _SettingsSheetState();
}

class _SettingsSheetState extends State<SettingsSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 32, 31, 36),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Morse Speed',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 8,
                activeTrackColor: Colors.blueAccent,
                inactiveTrackColor: Colors.grey.shade700,
                thumbColor: Colors.blueAccent,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
                valueIndicatorColor: Colors.blueAccent,
              ),
              child: Slider(
                value: Settings.dotMs.toDouble(),
                min: 50,
                max: 250,
                divisions: 20,
                label: '${Settings.dotMs} ms',
                onChanged: (value) {
                  setState(() {
                    Settings.dotMs = value.round();
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Beep Volume',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 8,
                activeTrackColor: Colors.blueAccent,
                inactiveTrackColor: Colors.grey.shade700,
                thumbColor: Colors.blueAccent,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
                valueIndicatorColor: Colors.blueAccent,
              ),
              child: Slider(
                value: Settings.beepVolume,
                min: 0.0,
                max: 1.0,
                divisions: 10,
                label: '${(Settings.beepVolume * 100).round()}%',
                onChanged: (value) {
                  setState(() {
                    Settings.beepVolume = value;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () {
                setState(() {
                  Settings.reset();
                });
              },
              icon: const Icon(Icons.refresh, color: Colors.grey),
              label: const Text(
                'Reset to default',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}