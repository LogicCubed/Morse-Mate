import 'package:flutter/material.dart';

class StopButton extends StatefulWidget {
  final double size;
  final VoidCallback onStop;

  const StopButton({
    Key? key,
    required this.onStop,
    this.size = 60,
  }) : super(key: key);

  @override
  _StopButtonState createState() => _StopButtonState();
}

class _StopButtonState extends State<StopButton> {
  bool _pressed = false;

  void _handlePress() {
    setState(() => _pressed = true);

    widget.onStop();

    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() => _pressed = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handlePress,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: _pressed ? Colors.red : Colors.white,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(
            Icons.stop,
            color: _pressed ? Colors.red : Colors.white,
            size: widget.size * 0.6,
          ),
        ),
      ),
    );
  }
}