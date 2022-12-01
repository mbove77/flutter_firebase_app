import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/trips_app_cupertino.dart';
import 'package:flutter_firebase_app/user/bloc/bloc_user.dart';
import 'package:flutter_firebase_app/user/model/app_user.dart';
import 'package:flutter_firebase_app/user/repository/firebase_auth.dart';
import 'package:flutter_firebase_app/widgets/gradient_back.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _handleSessionState();
  }

  Widget _handleSessionState() {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return googleLoginUI();
        } else {
          return const TripsAppCupertino();
        }
      },
    );
  }

  Widget googleLoginUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack("", MediaQuery.of(context).size.height, false),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  userBloc.login().then((user) => {
                        userBloc.updateUserData(AppUser(
                          null,
                          user?.uid,
                          user?.displayName??'',
                          user?.email??'',
                          user?.photoURL??'',
                          null,
                          null
                        ))
                      });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
