import 'package:flutter/material.dart';
import 'package:trips_app/review.dart';

class ReviewList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Review("assets/img/avatar.jpg", "Martin", "1 review 5 photos", 3.0, "Its an amazing place in Costa Rica."),
        Review("assets/img/avatar2.jpg", "Gisela", "1 review 5 photos", 4.5, "I want return to the Maldives Islands in the next vacations."),
      ],
    );
  }

}