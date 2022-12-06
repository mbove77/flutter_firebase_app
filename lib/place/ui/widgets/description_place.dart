import 'package:flutter/material.dart';

import '../../../widgets/button_purple.dart';
import '../../../widgets/stars.dart';

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
        right: 20.0,
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
            top: 350.0,
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

        Container(
          margin: const EdgeInsets.only(
            top: 353.0
          ),
          child: Stars(3.5, 25)
        )
      ],
    );

    final tittleBlock = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tittleStart,
        description,
        ButtonPurple(text: "Navigate", onPressed: (){})
      ],
    );

    return tittleBlock;
  }
}