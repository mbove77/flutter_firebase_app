import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_app/user/repository/firebase_auth.dart';

class AuthRepository {
  Future<User?> loginFirebase() {
    return FirebaseAuthApi().signInWithGoogle();
  }
}