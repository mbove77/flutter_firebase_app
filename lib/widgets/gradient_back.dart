import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  String tittle = "Popular";
  double height = 0.0;

  GradientBack(this.tittle, this.height);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0A2EA8),
            Color(0xFF00ABEC),
          ],
          begin: FractionalOffset(0.2, 0.0),
          end:  FractionalOffset(1.0, 0.6),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp
        )
      ),
    alignment: const Alignment(-0.9, -0.6),
    child: Text(
      tittle,
      style: const TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: "Lato"
      ),
    ),
    );
  }

}