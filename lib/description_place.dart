import 'package:flutter/material.dart';

class DescriptionPlace extends StatelessWidget {
  String tittle;
  double startNumber;
  String description;

  DescriptionPlace(this.tittle, this.startNumber, this.description);

  @override
  Widget build(BuildContext context) {

    final description = Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0
      ),

      child: Text(
        this.description,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: "Lato",
          fontSize: 16.0
        ),
      ),
    );


    final tittleStart = Row(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 320.0,
            left: 20.0,
            right: 20.0
          ),

          child: Text(
            tittle,
            style: const TextStyle(
              fontFamily: "Lato",
              fontSize: 32.0,
              fontWeight: FontWeight.w900
            ),

            textAlign: TextAlign.left,
          ),
        ),

        drawStars(startNumber)
      ],
    );

    final tittleBlock = Column(
      children: [
        tittleStart,
        description
      ],
    );

    return tittleBlock;
  }

  Row drawStars(double startNumber) {
    final start = Container(
      margin: const EdgeInsets.only(
          top: 323.0,
          right: 3.0
      ),
      child: const Icon(
        Icons.star,
        color: Color(0xFFf2C611),
      ),
    );

    final halfStar = Container(
      margin: const EdgeInsets.only(
          top: 323.0,
          right: 3.0
      ),
      child: const Icon(
        Icons.star_half,
        color: Color(0xFFf2C611),
      ),
    );

    final emptyStar = Container(
      margin: const EdgeInsets.only(
          top: 323.0,
          right: 3.0
      ),
      child: const Icon(
        Icons.star_outline,
        color: Colors.black26,
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

    return Row(
      children: [
        for (var i = 0; i < solidStars; i++) start,
        if(haveHalfStars) halfStar,
        for (var i = 0; i < emptyStars; i++) emptyStar,
      ],
    );

  }

}