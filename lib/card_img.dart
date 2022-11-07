import 'package:flutter/material.dart';

class CardImg extends StatelessWidget {
  String pathImg = "assets/img/mountain.jpeg";

  CardImg(this.pathImg);

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: 250.0,
      height: 350.0,
      margin: const EdgeInsets.only(
        top: 80.0,
        left: 20.0
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(pathImg),
            fit: BoxFit.cover 
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: const <BoxShadow> [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]
      ),
    );

    return card;
  }

}