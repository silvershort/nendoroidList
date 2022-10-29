import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nendoroid_db/controllers/firestore_controller.dart';
import 'package:nendoroid_db/controllers/nendo_controller.dart';
import 'package:nendoroid_db/models/backup_data.dart';

class DebugView extends StatelessWidget {
  DebugView({Key? key}) : super(key: key);
  final FirestoreController firestoreController = Get.find<FirestoreController>();
  final NendoController nendoController = Get.find<NendoController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          firestoreController.initDefaultSetting();
          nendoController.saveBackupData();
          firestoreController
              .createData(
                backupData: BackupData(
                  nendoList: nendoController.backupNendoList,
                  setList: nendoController.setList,
                  email: "silvershortdev@gmail.com",
                  commitHash: nendoController.localCommitHash,
                  backupDate: nendoController.localCommitDate,
                  commitDate: DateTime.now().toString(),
                ),
              )
              .then((value) => print("@@@ 업로드 성공"))
              .catchError((error, stackTrace) => print("@@@ 업로드 실패 : ${error.toString()}"));
        },
        child: const Text(
          "넨도 초기 데이터 업로드",
        ),
      ),
    );
  }
}
