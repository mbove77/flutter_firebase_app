import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/user/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'profile_place.dart';

class ProfilePlacesList extends StatelessWidget {
  ProfilePlacesList({Key? key}) : super(key: key);
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    const String dummyText =
        "Lorem ipsum dolor sit amet consectetur, adipiscing elit congue sem diam.";
    return Container(
        margin: const EdgeInsets.only(
          top: 275.0,
          bottom: 20.0,
        ),
        child: StreamBuilder(
            stream: userBloc.getPlacesStream(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const CircularProgressIndicator();
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  case ConnectionState.active:
                    return ListView(
                        children:
                            userBloc.buildPlaces(snapshot.data.docs));
                  case ConnectionState.done:
                    return ListView(
                        children:
                            userBloc.buildPlaces(snapshot.data.docs));
                }
              } else {
                return const CircularProgressIndicator();
              }
            }));
  }
}
