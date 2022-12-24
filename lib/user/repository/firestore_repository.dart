import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_app/user/repository/firestore_api.dart';
import '../../place/model/place.dart';
import '../model/app_user.dart';
import '../ui/widgets/profile_place.dart';

class FirestoreRepository {
  final firestoreApi = FirestoreApi();
  void updateUserData(AppUser user) => firestoreApi.updateUserData(user);
  Future<void> updatePlaceData(Place place) => firestoreApi.updatePlaceData(place);
  Stream<QuerySnapshot> getPlacesStream() => firestoreApi.getPlacesStream();
  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placeList) => firestoreApi.buildPlaces(placeList);
}