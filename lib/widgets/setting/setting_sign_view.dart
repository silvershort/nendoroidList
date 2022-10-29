import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nendoroid_db/controllers/auth_controller.dart';
import 'package:nendoroid_db/controllers/firestore_controller.dart';
import 'package:nendoroid_db/controllers/setting_controller.dart';
import 'package:nendoroid_db/models/backup_data.dart';
import 'package:nendoroid_db/pages/login_page.dart';
import 'package:nendoroid_db/widgets/dialog/terms_agree_bottom_sheet.dart';

import '../../controllers/nendo_controller.dart';
import '../dialog/common_dialog.dart';

class SettingSignView extends StatelessWidget {
  SettingSignView({Key? key}) : super(key: key);
  final AuthController authController = Get.find<AuthController>();
  final FirestoreController firestoreController = Get.find<FirestoreController>();
  final NendoController nendoController = Get.find<NendoController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.find<SettingController>().incrementDebugViewCount();
              },
              child: const Text(
                "로그인 정보",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            Obx(() {
              if (authController.user == null) {
                return IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    Get.dialog(
                      const CommonDialog(
                        title: "로그인 안내",
                        content: "스마트폰 기기변경, 초기화 등의 이유로 데이터 백업이 필요할때 이메일 로그인 후 데이터를 백업할 수 있습니다.\n만일의 사태에 대비해서 데이터 백업을 주기적으로 해두는것을 권장합니다.",
                        contentStyle: TextStyle(height: 1.3),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.help_outline,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
            const Text(
              " :",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Obx(() {
                if (authController.user == null) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextButton(
                      onPressed: () async {
                        if (Get.find<SettingController>().getTermsAndConditionsAgree()) {
                          authController.clearNotificationMessage();
                          Get.to(LoginPage());
                        } else {
                          Get.bottomSheet(
                            Wrap(
                              children: const [
                                TermsAgreeBottomSheet(),
                              ],
                            ),
                            isScrollControlled: true,
                          );
                        }
                      },
                      child: const Text(
                        "로그인 & 회원가입",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Text(
                    authController.user?.email ?? "이메일 주소를 불러오지 못했습니다.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  );
                }
              }),
            ),
            Obx(() {
              if (authController.user != null) {
                return IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    Get.dialog(
                      CommonDialog(
                        content: "로그아웃 하시겠습니까?\n\n(이후 로그인을 위해서는 다시 메일인증을 해야합니다.)",
                        negativeText: "취소",
                        positiveText: "확인",
                        positiveOnClick: () {
                          authController.signOut();
                        },
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.clear,
                    size: 16,
                  ),
                );
              } else {
                return const SizedBox();
              }
            })
          ],
        ),
        const SizedBox(height: 5.0),
        Obx(() {
          if (authController.user == null) {
            return const SizedBox();
          } else {
            return Column(
              children: [
                Row(
                  children: [
                    const SizedBox(height: 5.0),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (nendoController.nendoList.isEmpty) {
                              Get.dialog(
                                const CommonDialog(
                                  content: "넨도로이드 데이터를 먼저 받아주세요.",
                                ),
                              );
                            } else {
                              Get.dialog(
                                CommonDialog(
                                  content: "정말 데이터 복구를 진행하시겠습니까?\n\n(백업데이터와 현재데이터가 다를경우 백업데이터로 대체됩니다.)",
                                  positiveOnClick: () async {
                                    if (authController.user == null) {
                                      authController.wrongAuthentication("로그인 정보가 없습니다.");
                                      return;
                                    }
                                    firestoreController.initUserSetting(documentID: authController.user!.uid);
                                    await firestoreController.restoreData();
                                  },
                                  negativeText: "취소",
                                ),
                              );
                            }
                          },
                          child: const Text(
                            "데이터 복구",
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            if (authController.user == null) {
                              authController.wrongAuthentication("로그인 정보가 없습니다.");
                              return;
                            }
                            if (authController.user!.email == null) {
                              authController.wrongAuthentication("이메일 정보가 없습니다.");
                              return;
                            }
                            firestoreController.initUserSetting(documentID: authController.user!.uid);
                            nendoController.saveBackupData();
                            firestoreController
                                .createData(
                                  backupData: BackupData(
                                    nendoList: nendoController.backupNendoList,
                                    setList: [],
                                    email: authController.user!.email!,
                                    commitHash: nendoController.localCommitHash,
                                    backupDate: DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now()),
                                    commitDate: nendoController.localCommitDate,
                                  ),
                                )
                                .then((value) => firestoreController.successCreate())
                                .onError((error, stackTrace) => firestoreController.failCreate());
                          },
                          child: const Text(
                            "데이터 백업",
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            );
          }
        })
      ],
    );
  }
}
