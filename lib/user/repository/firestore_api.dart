import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_app/place/model/place.dart';

import '../model/app_user.dart';

class FirestoreApi {
  final String USERS = "users";
  final String PLACES = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> updateUserData(AppUser user) async {
    CollectionReference users = _db.collection(USERS);
    DocumentReference ref = users.doc(user.uid);

    return ref.set({
      'uid'        : user.uid,
      'name'       : user.name,
      'email'      : user.email,
      'photoURL'   : user.photoURL,
      'myPlaces'   : user.myPlaces,
      'myFavPlaces': user.myFavoritesPlaces,
      'lastSigIn'  : DateTime.now()
    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference places = _db.collection(PLACES);
    User? user = _auth.currentUser;

    places.add({
      'name'       : place.name,
      'description': place.description,
      'likes'      : place.likes,
      'photoURL'   : place.urlImage,
      'userOwner'  : "$USERS/${user?.uid}",
    });
  }
}
