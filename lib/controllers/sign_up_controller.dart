import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  late ActionCodeSettings acs;
  late TextEditingController textEditingController;

  @override
  void onInit() {
    super.onInit();
    textEditingController = TextEditingController();
    acs = ActionCodeSettings(
        // URL you want to redirect back to. The domain (www.example.com) for this
        // URL must be whitelisted in the Firebase Console.
        url: 'https://nendoroiddb.page.link/email',
        // This must be true
        handleCodeInApp: true,
        iOSBundleId: 'com.silvershort.nendoroidDb',
        androidPackageName: 'com.slivershort.nendoroid_db',
        // installIfNotAvailable
        androidInstallApp: true,
        // minimumVersion
        androidMinimumVersion: '12');
  }

  void signUp(String email) {
    print("@@@ email : ${email}");
    FirebaseAuth.instance.sendSignInLinkToEmail(
      email: email,
      actionCodeSettings: acs,
    ).catchError((onError) => print('@@@ Error : ${onError}'))
    .then((value) => print("@@@ 'Successfully sent email verificatio"));
    
  }
}
