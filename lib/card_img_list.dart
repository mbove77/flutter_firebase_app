import 'package:flutter/material.dart';
import 'package:trips_app/card_img.dart';

class CardImgList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: ListView(
        padding: const EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: [
          CardImg("assets/img/beach_palm.jpeg"),
          CardImg("assets/img/mountain.jpeg"),
          CardImg("assets/img/mountain_stars.jpeg"),
          CardImg("assets/img/river.jpeg"),
          CardImg("assets/img/sunset.jpeg"),
        ],
      ),
    );
  }

}