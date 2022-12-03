import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/place/ui/widgets/text_input_location.dart';
import 'package:flutter_firebase_app/widgets/gradient_back.dart';
import 'package:flutter_firebase_app/widgets/text_input.dart';

class AddPlaceScreen extends StatefulWidget {
  File? image;

  AddPlaceScreen(Key? key, this.image) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    final controllerTittlePlace = TextEditingController();
    final controllerDescriptionPlace = TextEditingController();
    final controllerLocationPlace = TextEditingController();

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
          ),
          Container(
            margin: const EdgeInsets.only(top: 120, bottom: 20),
            child: ListView(
              children: [
                Container(),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextInput("Tittle", null, controllerTittlePlace, 1),
                ),
                TextInput("Description", TextInputType.multiline, controllerDescriptionPlace, 4),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: TextInputLocation("Location", controllerLocationPlace, Icons.location_on)
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
