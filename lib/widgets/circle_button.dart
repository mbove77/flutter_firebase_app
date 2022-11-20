import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  CircleButton(Key? key, this.icon, this.iconSize, this.color, this.onPressed) : super(key: key);
  double iconSize;
  var icon;
  var color;
  final VoidCallback onPressed;

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        width: widget.iconSize,
        height: widget.iconSize - 10.0,
        margin: const EdgeInsets.only(left: 10.0, top: 20.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          widget.icon,
          color: widget.color,
        ),
      ),
    );
  }
}
