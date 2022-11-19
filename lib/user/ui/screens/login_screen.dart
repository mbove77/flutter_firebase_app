import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/user/repository/firebase_auth.dart';
import 'package:flutter_firebase_app/widgets/gradient_back.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return googleLoginUI();
  }

  Widget googleLoginUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack("", MediaQuery.of(context).size.height),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Text(
                  "Welcome \n This is your travel app!",
                  style: TextStyle(
                      fontSize: 35,
                      fontFamily: "lato",
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 30),
              SignInButton(
                Buttons.Google,
                onPressed: () {
                  FirebaseAuthApi().signInWithGoogle();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
