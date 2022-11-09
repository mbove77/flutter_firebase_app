import 'package:flutter/material.dart';

class FabGreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _FabGreen();
  }

}

class _FabGreen extends State<FabGreen> {
  var isSelected = false;

  void onPressedFab(){

    setState(() {
      isSelected = !isSelected;
    });

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: (isSelected) ? const Text("Added to favorites.") : const Text("Removed form favorites."),
          duration: const Duration(seconds: 1, milliseconds: 500),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
   return FloatingActionButton(
     onPressed: onPressedFab,
     backgroundColor: const Color(0xff11da53),
     mini: true,
     child: (isSelected) ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
   );
  }
}