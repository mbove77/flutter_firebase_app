import 'package:flutter/material.dart';
import '../screens/profile_header.dart';
import '../screens/profile_places_list.dart';
import '../screens/profile_toolbar.dart';

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