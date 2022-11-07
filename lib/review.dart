import 'package:flutter/material.dart';
import 'package:trips_app/stars.dart';

class Review extends StatelessWidget {
  String avatar = "assets/img/avatar.jpg";
  String name = "Martin Bove";
  String details = "1 review 5 images";
  double reviewStars = 4;
  String comment = "Its an amazing place in Costa Rica.";
  
  Review(this.avatar, this.name, this.details, this.reviewStars,  this.comment);

  @override
  Widget build(BuildContext context) {

    final userCommet = Container(
      margin: const EdgeInsets.only(
          left: 20.0,
          right: 20.0
      ),
      child: Text(
        comment,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontSize: 13.0,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );

    final userInfo = Container(
      margin: const EdgeInsets.only(
          left: 20.0,
      ),
      child: Row(
        children: [
          Text(
            details,
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontSize: 13.0,
                fontFamily: "Lato",
                color: Color(0xFFa3a5a7)
            ),
          ),
          Stars(reviewStars, 16)
        ],
      )
    );

    final userName = Container(
      margin: const EdgeInsets.only(
        left: 20.0
      ),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 17.0,
          fontFamily: "Lato"
        ),
      ),
    );

    final userDetails =  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          userName,
          userInfo,
          userCommet
        ],
      );


    final photo = Container(
     margin: const EdgeInsets.only(
       left: 20.0,
     ),
      width: 80.0,
      height: 80.0,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(avatar))
      ),
    );

    return
      Container(
        margin: const EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,

    ),
      child: Row(
        children: [
          photo,
          Expanded(child: userDetails)
        ],
      )
    );
  }
}