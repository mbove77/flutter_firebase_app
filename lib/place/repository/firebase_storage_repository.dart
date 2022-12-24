import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_firebase_app/place/repository/firebase_storage_api.dart';

class FirebaseStorageRepository {
  final FirebaseStorageApi storageApi = FirebaseStorageApi();

  Future<UploadTask> uploadFile(String path, File image) =>
      storageApi.uploadFile(path, image);


}
