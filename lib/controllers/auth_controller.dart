import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../utilities/hive_name.dart';
import '../widgets/dialog/common_dialog.dart';

class AuthController extends GetxService {
  late ActionCodeSettings acs;
  static AuthController instance = Get.find();
  final Rx<User?> _user = Rxn<User?>();
  User? get user => _user.value;

  final RxString _notificationMessage = "".obs;
  String get notificationMessage => _notificationMessage.value;

  late Box settingBox;
  FirebaseAuth authentication = FirebaseAuth.instance;

  @override
  void onInit() async {
    super.onInit();
    settingBox = await Hive.openBox<String>(HiveName.settingBoxName);
    acs = ActionCodeSettings(
        // URL you want to redirect back to. The domain (www.example.com) for this
        // URL must be whitelisted in the Firebase Console.
        url: 'https://nendoroiddb.page.link/',
        // This must be true
        handleCodeInApp: true,
        iOSBundleId: 'com.silvershort.nendoroidDb',
        androidPackageName: 'com.slivershort.nendoroid_db',
        // installIfNotAvailable
        androidInstallApp: true,
        // minimumVersion
        androidMinimumVersion: '12');
  }

  @override
  void onReady() {
    super.onReady();
    _user.value = authentication.currentUser;
    _user.bindStream(authentication.userChanges());

    if (user != null) {
      Get.snackbar(
        "로그인 완료",
        "${_user.value?.email} 으로 로그인 되었습니다.",
        snackPosition: SnackPosition.TOP,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
      );
    }

    ever(_user, moveToPage);
    initDynamicLinks();
  }

  void moveToPage(User? user) {
    if (user == null) {
    } else {

    }
  }

  void clearNotificationMessage() {
    _notificationMessage.value = "";
  }

  void signup(String email) {
    print("@@@ signup email : ${email}");
    FirebaseAuth.instance
        .sendSignInLinkToEmail(
          email: email.trim(),
          actionCodeSettings: acs,
        )
        .catchError((onError) {
          _notificationMessage.value = "메일전송에 실패했습니다.\nerror : ${onError.toString()}";
      })
        .then(
      (value) {
        // 앱이 재시작될수도 있으므로 이메일을 저장해둔다.
        settingBox.put(HiveName.emailKey, email.trim());
        _notificationMessage.value = "메일이 전송되었습니다.\n메일 내용에 있는 링크를 누르면 회원가입 및 로그인이 완료됩니다. 시간이 지나도 메일이 보이지 않는다면 스팸 메일함을 확인해주세요.";
      },
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    _user.value = null;
    return;
  }

  void wrongAuthentication(String content) {
    Get.snackbar(
      "잘못된 접근",
      content,
      snackPosition: SnackPosition.TOP,
      forwardAnimationCurve: Curves.elasticInOut,
      reverseAnimationCurve: Curves.easeOut,
    );
    signOut();
  }

  void showConfirmEmail(String email) {
    Get.dialog(
      CommonDialog(
        content: "$email로 인증메일을 보냅니다.",
        negativeText: "취소",
        positiveText: "확인",
        positiveOnClick: () {
          signup(email);
        },
      ),
    );
  }

  Future<void> initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) async {
      print("@@@ path : ${dynamicLinkData.link.path}");
      print("@@@ path : ${dynamicLinkData.link.toString()}");

      if (FirebaseAuth.instance.isSignInWithEmailLink(dynamicLinkData.link.toString())) {
        final userCredential = await FirebaseAuth.instance.signInWithEmailLink(
          email: settingBox.get(HiveName.emailKey),
          emailLink: dynamicLinkData.link.toString(),
        );
        _user.value = userCredential.user;
      } else {

      }
    }).onError((error) {
      print("@@@ dynamiclink error : ${error.toString()}");
    });

    // get any initial links
    final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
    print("@@@ link : ${initialLink?.link}");
    if (initialLink != null) {
      if (FirebaseAuth.instance.isSignInWithEmailLink(initialLink.link.toString())) {
        final userCredential = await FirebaseAuth.instance.signInWithEmailLink(
          email: settingBox.get(HiveName.emailKey),
          emailLink: initialLink.link.toString(),
        );
        _user.value = userCredential.user;
        print("@@@ user = ${userCredential.user?.email}");
        print("@@@ user = ${userCredential.user?.uid}");

        Get.snackbar(
          "로그인 완료",
          "${_user.value?.email}로 로그인 되었습니다.",
          snackPosition: SnackPosition.TOP,
          forwardAnimationCurve: Curves.elasticInOut,
          reverseAnimationCurve: Curves.easeOut,
        );
      }
    }
  }
}