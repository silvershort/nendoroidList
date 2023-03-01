import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/main.dart';
import 'package:nendoroid_db/models/backup_data.dart';
import 'package:nendoroid_db/views_common/dialog/common_dialog.dart';
import 'package:nendoroid_db/views_common/dialog/loading_dialog.dart';

class FirestoreController extends GetxController {
  static const String initCollectionName = 'InitData';
  static const String userCollectionName = 'BackupData';
  static const String initDocumentName = 'baseData';

  static const int limitLength = 800000;
  static const int splitCount = 1500;

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

  Future<void> restoreData() async {
    Get.dialog(const LoadingDialog());
    BackupData? backupData = await readData();
    if (backupData == null) {
      Get.back();
      return Future.error('백업데이터를 불러왔으나 null 값입니다.');
    }
    Get.find<NendoController>().restoreBackupList(backupData).then((value) {
      Get.back();
      Get.dialog(CommonDialog(content: "[${backupData.backupDate}]에 저장된 데이터를 성공적으로 불러왔습니다."));
    }).onError((error, stackTrace) {
      Get.back();
      Get.dialog(CommonDialog(content: "데이터백업에 실패했습니다.\n\n(error : ${error.toString()})"));
    });
    return;
  }

  Future<BackupData?> readData() async {
    try {
      BackupData? backupData;
      for (int i = 0; i < 1000; i++) {
        late DocumentSnapshot<Object?> snapshot;
        // 0번째 데이터는 순번이 없음 (기존 데이터 호환)
        if (i == 0) {
          snapshot = await _product.doc(_documentID).get();
        } else {
          snapshot = await _product.doc("${_documentID}_${i + 1}").get();
        }
        if (snapshot.data() == null) {
          break;
        }

        // 첫번째 데이터는 모든 데이터를 저장하고 이후 데이터는 넨도리스트 데이터만 골라서 붙여준다.
        if (i == 0) {
          backupData = BackupData.fromJson(snapshot.data() as Map<String, dynamic>);
        } else {
          final BackupData newBackupData = BackupData.fromJson(snapshot.data() as Map<String, dynamic>);
          backupData = backupData!.copyWith(nendoList: [...backupData.nendoList, ...newBackupData.nendoList]);
        }
      }
      return backupData;
    } catch (error, stackTrace) {
      logger.e(error, stackTrace);
      return null;
    }
  }

  Future<void> createData({required BackupData backupData}) async {
    if (state == FirestoreState.loading) return;
    _state.value = FirestoreState.loading;
    try {
      // 데이터길이가 길면 파이어스토어에 저장하지 못함. (리미트는 980000~990000 정도로 추정)
      // 따라서 데이터가 일정량을 초과할경우 넨도리스트 1500개를 기준으로 반갈죽해서 저장해준다.
      final int dataLength = jsonEncode(backupData.toJson()).length;
      if (dataLength > limitLength) {
        final int divideCount = (dataLength ~/ limitLength) + 1;
        for (int i = 0; i < divideCount; i++) {
          late BackupData data;
          if (i == divideCount - 1) {
            data = backupData.copyWith(nendoList: backupData.nendoList.sublist(splitCount * i));
          } else {
            data = backupData.copyWith(nendoList: backupData.nendoList.sublist(splitCount * i, splitCount * (i + 1)));
          }
          // 첫번째 도큐먼트 이름은 숫자를 붙이지 않는다 (기존 데이터 호환문제)
          // 두번째 도큐먼트부터는 뒤쪽에 _${숫자} 를 붙여준다.
          final String documentName = "$_documentID${i == 0 ? "" : "_${i + 1}"}";
          await _product.doc(documentName).set(jsonDecode(jsonEncode(data.toJson())));
        }
      } else {
        await _product.doc(_documentID).set(jsonDecode(jsonEncode(backupData.toJson())));
      }
      _state.value = FirestoreState.complete;
      return;
    } catch (e) {
      _state.value = FirestoreState.complete;
      return Future.error("데이터생성에 실패했습니다.\nerror : ${e.toString()}");
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