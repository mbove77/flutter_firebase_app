import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:trips_app/profile.dart';
import 'package:trips_app/search.dart';

import 'home_trips.dart';

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
                    label: ""
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: ""
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: ""
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
                  builder: (BuildContext context) => Search(),
                );
              case 2:
                return CupertinoTabView(
                  builder: (BuildContext context) => Profile(),
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
