import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_app/place/ui/screens/search.dart';
import 'package:flutter_firebase_app/user/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'place/ui/screens/home_trips.dart';
import 'user/ui/screens/profile.dart';


class TripsAppCupertino extends StatefulWidget {
  const TripsAppCupertino({Key? key}) : super(key: key);

  @override
  State<TripsAppCupertino> createState() => _TripsAppCupertinoState();
}

class _TripsAppCupertinoState extends State<TripsAppCupertino> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              backgroundColor: Colors.white.withOpacity(0.65),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home"
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: "Search"
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "Profile"
                ),
              ],
            ),
          tabBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return CupertinoTabView(
                  builder: (BuildContext context) => HomeTrips(),
                );
              case 1:
                return CupertinoTabView(
                  builder: (BuildContext context) => const Search(),
                );
              case 2:
                return CupertinoTabView(
                  builder: (BuildContext context) {
                    return BlocProvider<UserBloc>(
                      bloc: UserBloc(),
                      child: const Profile(),
                    );
                  }
                );
              default:  return CupertinoTabView(
                builder: (BuildContext context) => HomeTrips(),
              );
            }
          },
        ),
    );
  }
}
