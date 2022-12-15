import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/place/model/place.dart';
import 'package:flutter_firebase_app/place/ui/widgets/card_img.dart';
import 'package:flutter_firebase_app/place/ui/widgets/text_input_location.dart';
import 'package:flutter_firebase_app/user/bloc/bloc_user.dart';
import 'package:flutter_firebase_app/widgets/button_purple.dart';
import 'package:flutter_firebase_app/widgets/gradient_back.dart';
import 'package:flutter_firebase_app/widgets/loader_indicator.dart';
import 'package:flutter_firebase_app/widgets/text_input.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';

class AddPlaceScreen extends StatefulWidget {
  XFile? image;
  var isLoading = false;

  AddPlaceScreen({Key? key, this.image}) : super(key: key);

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
                          fileImgPath: widget.image?.path,
                          width: 350,
                          height: 220,
                          marginLeft: 0,
                          iconData: Icons.camera_alt,
                          onPressedFabIcon: () {
                            ImagePicker()
                                .pickImage(source: ImageSource.camera)
                                .then((imageValue) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AddPlaceScreen(image: imageValue)));
                            });
                          })),
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
                          handleUpload(context);
                        } else {
                          if (kDebugMode) {
                            print("Validation Fail.");
                          }
                        }
                      })
                ],
              ),
            ),
          ),
          if (widget.isLoading) ...[const LoaderIndicator()]
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

  void handleUpload(BuildContext context) async {
    final UserBloc userBloc = BlocProvider.of(context);

    setState(() {
      widget.isLoading = true;
    });


    try {
      final String? uid = userBloc.currentUser?.uid;
      String path = "$uid/${DateTime.now()}.jpg";
      File imageFile = File(widget.image!.path);

      if (uid == null) {
        return;
      }

      final uploadTask = await userBloc.uploadFile(path, imageFile);
      final taskSnapshot = await uploadTask.whenComplete(() => null);
      final imageUrl = await taskSnapshot.ref.getDownloadURL();

      userBloc
          .updatePlaceData(Place(
        name: controllerTittlePlace.text,
        description: controllerDescriptionPlace.text,
        urlImage: imageUrl,
        likes: 0,
      ))
          .whenComplete(() {
            setState(() {
              widget.isLoading = false;
            });
            Navigator.pop(context);
      });
    } catch (e) {
      if (kDebugMode) {
        setState(() {
          widget.isLoading = false;
        });
        print(e);
      }
      return;
    }
  }
}
