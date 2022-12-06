import 'dart:ffi';

import 'package:flutter/material.dart';
import '../../../widgets/fab_green.dart';

class CardImg extends StatelessWidget {
  double? width      = 250.0;
  double? height     = 350.0;
  double? marginLeft;
  String pathImg = "assets/img/mountain.jpeg";
  IconData iconData;
  VoidCallback onPressedFabIcon;

  CardImg({required this.pathImg, this.width, this.height, this.marginLeft, required this.iconData,
      required this.onPressedFabIcon, super.key});

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(
        left: marginLeft ?? 20.0,
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

    return Stack(
      alignment: const Alignment(0.85, 1.2),
      children: [
        card,
        FabGreen(buttonCallBack: onPressedFabIcon, iconData: iconData)
      ],
    );
  }

}