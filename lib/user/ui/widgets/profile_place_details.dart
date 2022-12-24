import 'package:flutter/material.dart';

class ProfilePlaceDetails extends StatelessWidget {
  String tittle, description;
  int? likes;

  ProfilePlaceDetails({Key? key, required this.tittle, required this.description,  this.likes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: 500.0,
      height: 120.0,
      margin: const EdgeInsets.only(top: 180.0, left: 55.0, right: 55.0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tittle,
              style: const TextStyle(
                  fontFamily: "Lato",
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                  fontFamily: "Lato", fontSize: 13.0, color: Colors.black45),
            ),
            const SizedBox(height: 10),
            Text(
              "$likes likes",
              style: const TextStyle(
                  fontFamily: "Lato",
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
          ],
        ),
      ),
    );

    return Container(
      child: card,
    );
  }
}
