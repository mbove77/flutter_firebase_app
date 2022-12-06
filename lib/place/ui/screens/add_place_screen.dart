import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/place/model/place.dart';
import 'package:flutter_firebase_app/place/ui/widgets/card_img.dart';
import 'package:flutter_firebase_app/place/ui/widgets/text_input_location.dart';
import 'package:flutter_firebase_app/user/bloc/bloc_user.dart';
import 'package:flutter_firebase_app/widgets/button_purple.dart';
import 'package:flutter_firebase_app/widgets/gradient_back.dart';
import 'package:flutter_firebase_app/widgets/text_input.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class AddPlaceScreen extends StatefulWidget {
  File? image;

  AddPlaceScreen(Key? key, this.image) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final controllerTittlePlace = TextEditingController();
  final controllerDescriptionPlace = TextEditingController();
  final controllerLocationPlace = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of(context);

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
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Container(
                      alignment: Alignment.center,
                      child: CardImg(
                          pathImg: "assets/img/placeholder.png",
                          width: 350,
                          height: 220,
                          marginLeft: 0,
                          iconData: Icons.camera_alt,
                          onPressedFabIcon: () {})),
                  const SizedBox(height: 20),
                  TextInput(
                      hintText: "Tittle",
                      controller: controllerTittlePlace,
                      maxLine: 1,
                      validator: tittleValidator),
                  const SizedBox(height: 20),
                  TextInput(
                      hintText: "Description",
                      textInputType: TextInputType.multiline,
                      controller: controllerDescriptionPlace,
                      maxLine: 4,
                      validator: descValidator),
                  const SizedBox(height: 20),
                  TextInputLocation(
                      "Location", controllerLocationPlace, Icons.location_on),
                  ButtonPurple(
                      text: "Add place",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          userBloc
                              .updatePlaceData(Place(
                                name: controllerTittlePlace.text,
                                description: controllerDescriptionPlace.text,
                                likes: 0,
                              ))
                              .whenComplete(() => {Navigator.pop(context)});
                        } else {
                          print("VALIDACION FALLIDA.");
                        }
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String? tittleValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'Este campo es obligatorio.';
    }
    if (fieldContent.length <= 6) {
      return 'Este campo debe ser mayor a 6 caracteres.';
    }
    return null;
  }

  String? descValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'Este campo es obligatorio.';
    }
    if (fieldContent.length <= 20) {
      return 'Este campo debe ser mayor a 20 caracteres.';
    }
    return null;
  }
}
