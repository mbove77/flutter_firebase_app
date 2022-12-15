import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageApi {
  final reference = FirebaseStorage.instance.ref();

  Future<UploadTask> uploadFile(String path, File image) async {
   return reference.child(path).putFile(image);
  }
}
