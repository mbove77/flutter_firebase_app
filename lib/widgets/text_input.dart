import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final TextInputType? textInputType;
  final TextEditingController controller;
  int? maxLine = 1;
  final String? Function(String?)? validator;

  TextInput({
      required this.hintText,
      this.textInputType,
      required this.controller,
      this.maxLine,
      this.validator,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: TextFormField(
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          keyboardType: textInputType,
          maxLines: maxLine,
          style: const TextStyle(
              fontSize: 15, fontFamily: "Lato", color: Colors.blueGrey),
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFe5e5e5),
              border: InputBorder.none,
              hintText: hintText,
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffa10e32)),
                  borderRadius: BorderRadius.all(Radius.circular(9))),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffa10e32)),
                  borderRadius: BorderRadius.all(Radius.circular(9))),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                  borderRadius: BorderRadius.all(Radius.circular(9))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                  borderRadius: BorderRadius.all(Radius.circular(9)))),
        ));
  }
}
