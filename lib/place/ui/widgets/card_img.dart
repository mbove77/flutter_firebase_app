import 'dart:io';
import 'package:flutter/material.dart';
import '../../../widgets/fab_green.dart';

class CardImg extends StatelessWidget {
  double? width      = 250.0;
  double? height     = 350.0;
  double? marginLeft;
  String? fileImgPath;
  String? assetFile;
  IconData iconData;
  VoidCallback onPressedFabIcon;

  CardImg({this.fileImgPath, this.assetFile, this.width, this.height, this.marginLeft, required this.iconData,
      required this.onPressedFabIcon, super.key});

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object> provider;
    if(fileImgPath != null) {
      provider = FileImage(File(fileImgPath!));
    } else {
      provider = AssetImage(assetFile!);
    }

    final card = Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(
        left: marginLeft ?? 20.0,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: provider,
            fit: BoxFit.cover
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: const <BoxShadow> [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]
      ),
    );

    return Stack(
      alignment: const Alignment(0.85, 1.2),
      children: [
        card,
        FabGreen(buttonCallBack: onPressedFabIcon, iconData: iconData)
      ],
    );
  }

}