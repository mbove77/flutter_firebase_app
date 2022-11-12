import 'package:flutter/material.dart';
import 'package:trips_app/profile/profile_header.dart';
import 'package:trips_app/profile/profile_places_list.dart';
import 'package:trips_app/profile/profile_toolbar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        ProfileHeader(),
        ProfileToolbar(),
        ProfilePlacesList()
      ],
    );
  }
}
