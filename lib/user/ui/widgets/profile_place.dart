import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/user/ui/widgets/profile_place_details.dart';

class ProfilePlace extends StatelessWidget {
  ProfilePlace(
      Key? key, this.imageUrl, this.tittle, this.description, this.steps)
      : super(key: key);

  String imageUrl, tittle, description, steps;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: 500.0,
      height: 200.0,
      margin: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10),
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );

    return Stack(
      children: [
        card,
        ProfilePlaceDetails(key, tittle, description, steps),
      ],
    );
  }
}
