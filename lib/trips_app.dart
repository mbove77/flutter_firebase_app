import 'package:flutter/material.dart';
import 'package:trips_app/home_trips.dart';
import 'package:trips_app/profile.dart';
import 'package:trips_app/search.dart';

class TripsApp extends StatefulWidget {
  const TripsApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TripsApp();
  }
}

class _TripsApp extends State<TripsApp> {
  int tabIndex = 0;

  final List<Widget> pageList = [
    HomeTrips(),
    const Search(),
    const Profile(),
  ];

  void onTapTapped(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
              primaryColor: Colors.purple
            ),
            child: BottomNavigationBar(
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
              currentIndex: tabIndex,
              onTap: onTapTapped,
            )
          ),
        body: pageList[tabIndex]
    );
  }
}
