import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_app/place/model/place.dart';

import '../model/app_user.dart';
import '../ui/widgets/profile_place.dart';

class FirestoreApi {
  final String USERS = "users";
  final String PLACES = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> updateUserData(AppUser user) async {
    CollectionReference users = _db.collection(USERS);
    DocumentReference ref = users.doc(user.uid);

    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavPlaces': user.myFavoritesPlaces,
      'lastSigIn': DateTime.now()
    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference places = _db.collection(PLACES);
    User? user = _auth.currentUser;

    places.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'photoURL': place.urlImage,
      'userOwner': _db.doc("$USERS/${user?.uid}"),
    }).then((placeRef) {
      DocumentReference refUser = _db.collection(USERS).doc(user?.uid);
      refUser.update({
        'myPlaces': FieldValue.arrayUnion([_db.doc("$PLACES/${placeRef.id}")])
      });
    });
  }

  Stream<QuerySnapshot> getPlacesStream(String uid) {
    Stream<QuerySnapshot> placesStream = _db
        .collection(PLACES)
        .where("userOwner",
            isEqualTo: FirebaseFirestore.instance.doc("$USERS/$uid"))
        .snapshots();

    return placesStream;
  }

  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placeList) {
    List<ProfilePlace> profilePlacesList = <ProfilePlace>[];

    placeList.forEach((place) {
      profilePlacesList.add(ProfilePlace(
        place: Place(
            name: place['name'],
            description: place['description'],
            urlImage: place['photoURL'],
            likes: place['likes']),
      ));
    });

    return profilePlacesList;
  }
}
