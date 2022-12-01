import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/widgets/gradient_back.dart';

class AddPlaceScreen extends StatefulWidget {
  File? image;

  AddPlaceScreen(Key? key, this.image) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GradientBack("Add New Place", 200.0, true),
          Container(
            padding: const EdgeInsets.only(top: 35, left: 0),
            child: SizedBox(
                width: 45,
                height: 45,
                child: IconButton(
                    icon: const Icon(Icons.keyboard_arrow_left,
                        color: Colors.white, size: 45),
                    onPressed: () {
                      Navigator.pop(context);
                    })),
          )
        ],
      ),
    );
  }
}
