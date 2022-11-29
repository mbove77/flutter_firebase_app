import 'package:flutter/material.dart';

import '../../place/model/place.dart';

class AppUser {
  String? uid;
  String name, email, photoURL;
  List<Place>? myPlaces;
  List<Place>? myFavoritesPlaces;

  AppUser(Key? key, this.uid, this.name, this.email, this.photoURL, this.myPlaces,
      this.myFavoritesPlaces);
}
