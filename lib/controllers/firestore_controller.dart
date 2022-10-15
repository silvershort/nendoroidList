import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/models/backup_data.dart';

class FirestoreController extends GetxController {
  late CollectionReference product;

  Future<BackupData?> getBackupNendoData({
    String documentID = 'initData',
  }) async {
    product = FirebaseFirestore.instance.collection('BackupData');
    DocumentSnapshot<Object?> snapshot = await product.doc(documentID).get();
    if (snapshot.data() == null) {
      return null;
    }
    Map<String, dynamic> dataMap = snapshot.data() as Map<String, dynamic>;
    return BackupData.fromJson(dataMap);
  }

  Future<void> createBackupData({
    required BackupData backupData,
    required String documentID,
  }) async {
    product = FirebaseFirestore.instance.collection('BackupData');
    await product.doc(documentID).set(jsonDecode(jsonEncode(backupData.toJson())));
    return;
  }
}
