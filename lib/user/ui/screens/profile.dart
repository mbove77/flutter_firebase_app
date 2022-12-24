import 'package:flutter/material.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_places_list.dart';
import '../widgets/profile_toolbar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProfileHeader(),
        ProfileToolbar(),
        ProfilePlacesList()
      ],
    );
  }
}