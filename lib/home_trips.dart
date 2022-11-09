import 'package:flutter/material.dart';
import 'package:trips_app/review_list.dart';

import 'description_place.dart';
import 'header_app_bar.dart';

class HomeTrips extends StatelessWidget {

  final String dummyText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sit amet ullamcorper dolor. Pellentesque quis enim a elit bibendum accumsan. Etiam id nulla quis magna luctus rhoncus. \n\nMorbi pharetra molestie libero nec accumsan. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec et ante urna. Mauris a mauris porta, vulputate sapien vel, ultrices velit. Pellentesque vel diam nisi.Nulla sed pharetra massa.';

  @override
  Widget build(BuildContext context) {
   return Stack(
     children: [
       ListView(
         children: [
           DescriptionPlace("Bahamas", 3.5, dummyText),
           ReviewList()
         ],
       ),
       HeaderAppBar()
     ],
   );
  }
}