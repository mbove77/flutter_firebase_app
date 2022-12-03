import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final TextInputType? textInputType;
  final TextEditingController textEditingController;
  int? maxLine = 1;

  TextInput(this.hintText, this.textInputType, this.textEditingController,
      this.maxLine,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: TextField(
          controller: textEditingController,
          keyboardType: textInputType,
          maxLines: maxLine,
          style: const TextStyle(
              fontSize: 15, fontFamily: "Lato", color: Colors.blueGrey),
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFe5e5e5),
              border: InputBorder.none,
              hintText: hintText,
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                  borderRadius: BorderRadius.all(Radius.circular(9))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                  borderRadius: BorderRadius.all(Radius.circular(9)))),
        ));
  }
}
