import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/app_user.dart';

class FirestoreApi {
  final String USERS = "users";
  final String PLACE = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;

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
}
