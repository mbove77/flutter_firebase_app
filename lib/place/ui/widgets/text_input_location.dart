import 'package:flutter/material.dart';

class TextInputLocation extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final IconData? fieldIcon;

  const TextInputLocation(
      this.hintText, this.textEditingController, this.fieldIcon,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 20, left: 20),
        decoration: const BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black12, blurRadius: 15, offset: Offset(0, 7))
        ]),
        child: TextField(
          controller: textEditingController,
          style: const TextStyle(
              fontSize: 15, fontFamily: "Lato", color: Colors.blueGrey),
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: Icon(fieldIcon),
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(9))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(9))),
          ),
        ));
  }
}
