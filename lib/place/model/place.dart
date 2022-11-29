import 'package:flutter/material.dart';
import '../../user/model/app_user.dart';

class Place {
  String? uid;
  String name, description, urlImage;
  int? likes;
  AppUser userOwner;

  Place(Key? key, this.uid, this.name, this.description, this.urlImage,
      this.likes, this.userOwner);
}
