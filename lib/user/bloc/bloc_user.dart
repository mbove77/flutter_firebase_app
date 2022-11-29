import 'package:flutter_firebase_app/user/model/app_user.dart';
import 'package:flutter_firebase_app/user/repository/auth_repository.dart';
import 'package:flutter_firebase_app/user/repository/firestore_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserBloc implements Bloc {

  final _authRepo = AuthRepository();

  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;

  Future<User?>login() {
    return _authRepo.loginFirebase();
  }

  signOut() {
    _authRepo.signOut();
  }

  final firestoreRepository = FirestoreRepository();
  void updateUserData(AppUser user) => firestoreRepository.updateUserData(user);

  @override
  void dispose() {
    // TODO: implement dispose
  }

}