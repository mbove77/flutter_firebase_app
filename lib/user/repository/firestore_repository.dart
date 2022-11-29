import 'package:flutter_firebase_app/user/repository/firestore_api.dart';
import '../model/app_user.dart';

class FirestoreRepository {
  final firestoreApi = FirestoreApi();
  void updateUserData(AppUser user) => firestoreApi.updateUserData(user);
}