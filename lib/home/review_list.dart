import 'package:flutter/material.dart';
import 'package:trips_app/home/review.dart';

class ReviewList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(
              top: 20.0,
              left: 20.1,
              bottom: 00.0,
              right: 20.0),
          child:  const Text(
            "All Reviews:",
            style: TextStyle(
                fontSize: 14.0,
                fontFamily: "Lato",
                color: Colors.black45
            ),
          ),
        ),
        Review("assets/img/avatar.jpg", "Martin", "1 review 5 photos", 3.0, "Its an amazing place in Costa Rica."),
        Review("assets/img/avatar2.jpg", "Gisela", "1 review 5 photos", 4.5, "I want return to the Maldives Islands in the next vacations."),
      ],
    );
  }

}