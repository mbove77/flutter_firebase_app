import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  double startNumber = 4.5;
  double startSize = 20.0;

  Stars(this.startNumber, this.startSize);

  @override
  Widget build(BuildContext context) {
    final start = Container(
      margin: const EdgeInsets.only(
          top: 2.0,
          right: 3.0
      ),
      child: Icon(
        Icons.star,
        color: const Color(0xFFf2C611),
        size: startSize,
      ),
    );

    final halfStar = Container(
      margin: const EdgeInsets.only(
          top: 2.0,
          right: 3.0
      ),
      child: Icon(
        Icons.star_half,
        color: const Color(0xFFf2C611),
        size: startSize,
      ),
    );

    final emptyStar = Container(
      margin: const EdgeInsets.only(
          top: 2.0,
          right: 3.0
      ),
      child: Icon(
        Icons.star_outline,
        color: Colors.black26,
        size: startSize,
      ),
    );

    var solidStars = int.parse(startNumber.toString().split('.')[0]);
    var haveHalfStars =  false;
    var emptyStars = 0;

    if(int.parse(startNumber.toString().split('.')[1]) == 5) {
      haveHalfStars = true;
      emptyStars = 4 - solidStars;
    } else {
      emptyStars = 5 - solidStars;
    }

    return  Container(
      margin: const EdgeInsets.only(
        left: 10.0
      ),
      child: Row(
        children: [
          for (var i = 0; i < solidStars; i++) start,
          if(haveHalfStars) halfStar,
          for (var i = 0; i < emptyStars; i++) emptyStar,
        ],
      ),
    );
  }
}