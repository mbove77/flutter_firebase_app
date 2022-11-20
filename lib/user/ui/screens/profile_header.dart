import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/user/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:intl/intl.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({Key? key}) : super(key: key);
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return StreamBuilder(
      stream: userBloc.streamFirebase,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const CircularProgressIndicator();
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);
        }
      },
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return baseHeader([
        const CircularProgressIndicator(),
        const Text("No se pudo cargar la información. Haz login.")
      ]);
    } else {
      return baseHeader([
        userPhoto(snapshot.data.photoURL),
        userBlock(snapshot.data.displayName, snapshot.data.email, snapshot.data.metadata.lastSignInTime)
      ]);
    }
  }

  Widget baseHeader(List<Widget> widgets) {
    return Container(
      height: 350.0,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF00ABEC),
                Color(0xFF0A2EA8),
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.8],
              tileMode: TileMode.clamp)),
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
                  fontFamily: "Lato"),
            ),
          ),
          Row(
            children: widgets,
          )
        ],
      ),
    );
  }

  Widget userBlock(String userName, String email, DateTime lastLogin) {
    String myDate = DateFormat('dd/MM/yyyy - hh:mm').format(lastLogin);


    return Container(
      margin: const EdgeInsets.only(top: 12.0, left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(
            userName,
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
          ),
          Text(
            email,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 16.0, fontFamily: "Lato", color: Color(0xDDDDDDFF)),
          ),
          const SizedBox(height: 5,),
          Text(
            "Login: $myDate",
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 12.0, fontFamily: "Lato", color: Color(0xDDDDDDFF)),
          ),
        ],
      ),
    );
  }

  Widget userPhoto(String imageUrl) {
    return Container(
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
              fit: BoxFit.cover, image: NetworkImage(imageUrl))),
    );
  }

}


