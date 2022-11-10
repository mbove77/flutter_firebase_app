import 'package:flutter/material.dart';
import 'package:trips_app/profile/profile_toolbar.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String avatar = "assets/img/avatar.jpg";

    var photo = Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
      ),
      width: 80.0,
      height: 80.0,

      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: Colors.white,
              width: 2.0,
          ),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(avatar))
      ),
    );

    var userNameBlock = Container(
      child: Container(
        margin: const EdgeInsets.only(
          top: 5.0,
          left: 15.0
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Martin Bove",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Lato",
                  color: Colors.white
              ),
            ),
            Text(
              "mbove77@gmail.com",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Lato",
                  color: Color(0xDDDDDDFF)
              ),
            ),
          ],
        ),
      ),
    );

    return Container(
      height: 350.0,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF00ABEC),
                Color(0xFF0A2EA8),
              ],
              begin: FractionalOffset(0.2, 0.0),
              end:  FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.8],
              tileMode: TileMode.clamp
          )
      ),
      alignment: const Alignment(-0.9, -0.6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 60.0,
              left: 20.0,
            ),
            child: const Text(
              "Profile",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Lato"
              ),
            ),
          ),
          Row(
            children: [
              photo,
              userNameBlock,
            ],
          )
        ],
      ),
    );
  }
}
