import 'package:flutter/material.dart';

class LoopButton extends StatefulWidget {
  final double size;
  final ValueChanged<bool> onToggle; // callback to parent
  final bool isLooping;
  
  const LoopButton({
    Key? key,
    this.size = 60,
    required this.onToggle,
    this.isLooping = false,
  }) : super(key: key);

  @override
  _LoopButtonState createState() => _LoopButtonState();
}

class _LoopButtonState extends State<LoopButton> {
  late bool _isLooping;

  @override
  void initState() {
    super.initState();
    _isLooping = widget.isLooping;
  }

  void _toggleLoop() {
    setState(() => _isLooping = !_isLooping);
    widget.onToggle(_isLooping); // notify parent
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleLoop,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: _isLooping
              ? const Color.fromARGB(255, 111, 255, 89)
              : Colors.white,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(
            Icons.loop,
            color: _isLooping
                ? const Color.fromARGB(255, 111, 255, 89)
                : Colors.white,
            size: widget.size * 0.6,
          ),
        ),
      ),
    );
  }
}