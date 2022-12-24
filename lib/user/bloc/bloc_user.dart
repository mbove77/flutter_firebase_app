import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_firebase_app/user/model/app_user.dart';
import 'package:flutter_firebase_app/user/repository/auth_repository.dart';
import 'package:flutter_firebase_app/user/repository/firestore_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../place/model/place.dart';
import '../../place/repository/firebase_storage_repository.dart';
import '../ui/widgets/profile_place.dart';

class UserBloc implements Bloc {

  final _authRepo      = AuthRepository();
  final _storageRepo   = FirebaseStorageRepository();
  final _firestoreRepo = FirestoreRepository();

  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;

  Future<User?>login() => _authRepo.loginFirebase();
  signOut() => _authRepo.signOut();

  void updateUserData(AppUser user) => _firestoreRepo.updateUserData(user);
  Future<void> updatePlaceData(Place place) => _firestoreRepo.updatePlaceData(place);
  User? get currentUser => FirebaseAuth.instance.currentUser;

  Future<UploadTask> uploadFile(String path, File image) => _storageRepo.uploadFile(path, image);

  Stream<QuerySnapshot> getPlacesStream() => _firestoreRepo.getPlacesStream(currentUser!.uid);

  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placeList) => _firestoreRepo.buildPlaces(placeList);

  @override
  void dispose() {
    // TODO: implement dispose
  }

}