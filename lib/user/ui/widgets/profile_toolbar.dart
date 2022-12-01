import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/place/ui/screens/add_place_screen.dart';
import 'package:flutter_firebase_app/user/bloc/bloc_user.dart';
import 'package:flutter_firebase_app/widgets/circle_button.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ProfileToolbar extends StatelessWidget {
  ProfileToolbar({Key? key}) : super(key: key);
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Container(
      margin: const EdgeInsets.only(
        top: 190.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleButton(null, Icons.vpn_key, 50, Colors.indigo, () { }),
          CircleButton(null, Icons.add, 65, Colors.indigo, () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddPlaceScreen(null, null)));
          }),
          CircleButton(null, Icons.exit_to_app, 50, Colors.indigo, () { userBloc.signOut(); }),
        ],
      ),
    );
  }
}
