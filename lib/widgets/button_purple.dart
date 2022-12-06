import 'package:flutter/material.dart';

class ButtonPurple extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonPurple({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0
        ),
        width: 180.0,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: const LinearGradient(
            colors: [
              Color(0xff4268d3),
              Color(0xff584cd1)
            ],
            begin: FractionalOffset(0.6, 0.0),
            end: FractionalOffset(1.0, 0.6),
            stops: [0.0, 0.6],
            tileMode: TileMode.clamp
          ),
        ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 18.0,
            color: Colors.white
          ),

        ),
      ),
      ),
    );
  }

}