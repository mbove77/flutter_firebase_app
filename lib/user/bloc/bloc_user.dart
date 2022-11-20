import 'package:flutter_firebase_app/user/repository/AuthRepository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserBloc implements Bloc {

  final _authRepo = AuthRepository();

  Future<User?>login() {
    return _authRepo.loginFirebase();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

}