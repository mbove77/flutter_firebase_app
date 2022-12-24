import 'package:flutter/material.dart';
import '../../user/model/app_user.dart';

class Place {
  String? uid;
  String name, description;
  String urlImage;
  int? likes;
  AppUser? userOwner;

  Place({Key? key, this.uid, required this.name, required this.description, required this.urlImage,
      this.likes, this.userOwner});
}
