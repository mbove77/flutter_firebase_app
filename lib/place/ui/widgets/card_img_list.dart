import 'package:flutter/material.dart';
import 'card_img.dart';

class CardImgList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.0,

      child: ListView(
        padding: const EdgeInsets.only(bottom: 35.0, left: 1, right: 20),
        scrollDirection: Axis.horizontal,
        children: [
          CardImg(
              assetFile:"assets/img/beach_palm.jpeg",
              width: 350.0,
              height: 220.0,
              iconData: Icons.favorite_border,
              onPressedFabIcon: () {}),
          CardImg(
              assetFile: "assets/img/mountain.jpeg",
              width: 350.0,
              height: 220.0,
              iconData: Icons.favorite_border,
              onPressedFabIcon: () {}),
          CardImg(
              assetFile: "assets/img/mountain_stars.jpeg",
              width: 350.0,
              height: 220.0,
              iconData: Icons.favorite_border,
              onPressedFabIcon: () {}),
          CardImg(
              assetFile: "assets/img/river.jpeg",
              width: 350.0,
              height: 220.0,
              iconData: Icons.favorite_border,
              onPressedFabIcon: () {}),
          CardImg(
              assetFile: "assets/img/sunset.jpeg",
              width: 350.0,
              height: 220.0,
              iconData: Icons.favorite_border,
              onPressedFabIcon: () {}),
        ],
      ),
    );
  }
}
