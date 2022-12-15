import 'package:flutter/material.dart';

class LoaderIndicator extends StatelessWidget {
  const LoaderIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150.0,
        height: 150.0,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0.7),
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: const <BoxShadow>[
              BoxShadow(color: Colors.black12, blurRadius: 15, offset: Offset(0, 7))
            ]
        ),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
