import 'package:flutter/material.dart';

class ProfileToolbar extends StatelessWidget {
  const ProfileToolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 190.0,
      ),
      child: Row(
        children: [
          Container(
            width: 50.0,
            height: 40.0,
            margin: const EdgeInsets.only(left: 20.0, top: 20.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(
              Icons.bookmark_border,
              color: Colors.indigo,
            ),
          ),
          Container(
            width: 50.0,
            height: 40.0,
            margin: const EdgeInsets.only(left: 20.0, top: 20.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(
              Icons.card_giftcard,
              color: Colors.indigo,
            ),
          ),
          Container(
            width: 65.0,
            height: 65.0,
            margin: const EdgeInsets.only(left: 20.0, top: 20.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.indigo,
            ),
          ),
          Container(
            width: 50.0,
            height: 40.0,
            margin: const EdgeInsets.only(left: 20.0, top: 20.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(
              Icons.mail,
              color: Colors.indigo,
            ),
          ),
          Container(
            width: 50.0,
            height: 40.0,
            margin: const EdgeInsets.only(left: 20.0, top: 20.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(
              Icons.person,
              color: Colors.indigo,
            ),
          ),
        ],
      ),
    );
  }
}
