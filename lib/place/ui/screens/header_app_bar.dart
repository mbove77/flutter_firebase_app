import 'package:flutter/material.dart';
import '../widgets/card_img_list.dart';
import '../widgets/gradient_back.dart';

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