import 'package:flutter/material.dart';
import 'package:trips_app/home/card_img_list.dart';
import 'package:trips_app/home/gradient_back.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientBack("Popular"),
        CardImgList()
      ],
    );
  }
  
}