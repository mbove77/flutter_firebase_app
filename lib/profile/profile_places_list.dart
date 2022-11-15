import 'package:flutter/material.dart';
import 'package:trips_app/profile/profile_place.dart';

class ProfilePlacesList extends StatelessWidget {
  const ProfilePlacesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String dummyText = "Lorem ipsum dolor sit amet consectetur, adipiscing elit congue sem diam.";
    return Container(
      margin: const EdgeInsets.only(
        top: 275.0,
        bottom: 20.0,
      ),
      child: ListView(
        children: [
          ProfilePlace(key, "assets/img/beach_palm.jpeg", "Costa Rica", dummyText, "Steps: 123,123,123"),
          ProfilePlace(key, "assets/img/sunset.jpeg", "Tibet, Nepal", dummyText, "Steps: 123,123,123"),
          ProfilePlace(key, "assets/img/mountain.jpeg", "Nebraska rocks", dummyText, "Steps: 123,123,123"),
        ],
      ),
    );
  }
}
