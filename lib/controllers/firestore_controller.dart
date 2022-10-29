import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/models/backup_data.dart';

import '../widgets/dialog/loading_dialog.dart';

class FirestoreController extends GetxController {
  final String initCollectionName = 'InitData';
  final String userCollectionName = 'BackupData';
  final String initDocumentName = 'baseData';

  late CollectionReference _product;
  String? _documentID;

  final Rx<FirestoreState> _state = FirestoreState.complete.obs;
  FirestoreState get state => _state.value;

  @override
  void onInit() {
    super.onInit();
    initDefaultSetting();
  }

  void initUserSetting({required String documentID}) {
    _product = FirebaseFirestore.instance.collection(userCollectionName);
    _documentID = documentID;
  }

  void initDefaultSetting() {
    _product = FirebaseFirestore.instance.collection(initCollectionName);
    _documentID = initDocumentName;
  }

  void successCreate() {
    Get.snackbar(
      "알림",
      "데이터 백업이 완료되었습니다!",
      snackPosition: SnackPosition.TOP,
      forwardAnimationCurve: Curves.elasticInOut,
      reverseAnimationCurve: Curves.easeOut,
    );
  }

  void failCreate() {
    Get.snackbar(
      "오류",
      "데이터 백업에 실패했습니다.",
      snackPosition: SnackPosition.TOP,
      forwardAnimationCurve: Curves.elasticInOut,
      reverseAnimationCurve: Curves.easeOut,
    );
  }

  Future<void> restoreData() async {
    Get.dialog(const LoadingDialog());
    BackupData? backupData = await readData();
    if (backupData == null) {
      Get.back();
      return Future.error('백업데이터를 불러왔으나 null 값입니다.');
    }
    await Get.find<NendoController>().restoreBackupList(backupData);
    Get.back();
    return;
  }

  Future<BackupData?> readData() async {
    try {
      DocumentSnapshot<Object?> snapshot = await _product.doc(_documentID).get();
      if (snapshot.data() == null) {
        return null;
      }
      Map<String, dynamic> dataMap = snapshot.data() as Map<String, dynamic>;
      return BackupData.fromJson(dataMap);
    } catch (e) {
      return null;
    }
  }

  Future<void> createData({required BackupData backupData}) async {
    if (state == FirestoreState.loading) return;
    _state.value = FirestoreState.loading;

    try {
      await _product.doc(_documentID).set(jsonDecode(jsonEncode(backupData.toJson())));
      _state.value = FirestoreState.complete;
      return;
    } catch (e) {
      _state.value = FirestoreState.complete;
      return Future.error("데이터생성에 실패했습니다.");
    }
  }

  Future<void> deleteData() async {
    if (state == FirestoreState.loading) return;
    _state.value = FirestoreState.loading;

    try {
      await _product.doc(_documentID).delete();
      _state.value = FirestoreState.complete;
      return;
    } catch (e) {
      _state.value = FirestoreState.complete;
      return Future.error("데이터삭제에 실패했습니다.");
    }
  }

  Future<void> updateData({required BackupData backupData, required String documentID}) async {
    if (state == FirestoreState.loading) return;
    _state.value = FirestoreState.loading;

    try {
      await _product.doc(documentID).update(jsonDecode(jsonEncode(backupData.toJson())));
      _state.value = FirestoreState.complete;
      return;
    } catch (e) {
      _state.value = FirestoreState.complete;
      return Future.error("업데이트에 실패했습니다.");
    }
  }
}

enum FirestoreState {
  loading,
  complete,
}