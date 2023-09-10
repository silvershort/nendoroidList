import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:hive/hive.dart';
import 'package:nendoroid_db/main_new.dart';
import 'package:nendoroid_db/provider/hive_provider.dart';
import 'package:nendoroid_db/utilities/hive_name.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  late Box _settingBox;
  late ActionCodeSettings _acs;
  final FirebaseAuth _authentication = FirebaseAuth.instance;

  @override
  User? build() {
    _settingBox = ref.read(hiveProvider).settingBox;
    _acs = ActionCodeSettings(
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
    initDynamicLinks();
    return null;
  }

  FutureOr<User?> init() {
    final User? user = _authentication.currentUser;
    return user;
  }

  Future<void> initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) async {
      if (FirebaseAuth.instance.isSignInWithEmailLink(dynamicLinkData.link.toString())) {
        final userCredential = await FirebaseAuth.instance.signInWithEmailLink(
          email: _settingBox.get(HiveName.emailKey),
          emailLink: dynamicLinkData.link.toString(),
        );
        state = userCredential.user;
      } else {

      }
    }).onError((error) {
      logger.e(error.toString());
    });

    // get any initial links
    final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
    if (initialLink != null) {
      if (FirebaseAuth.instance.isSignInWithEmailLink(initialLink.link.toString())) {
        final userCredential = await FirebaseAuth.instance.signInWithEmailLink(
          email: _settingBox.get(HiveName.emailKey),
          emailLink: initialLink.link.toString(),
        );
        state = userCredential.user;
      }
    }
  }

  Future<void> signup(String email) async {
    await FirebaseAuth.instance.sendSignInLinkToEmail(
      email: email.trim(),
      actionCodeSettings: _acs,
    );

    // 앱이 재시작될수도 있으므로 이메일을 저장해둔다.
    _settingBox.put(HiveName.emailKey, email.trim());
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    state = null;
    return;
  }

  Future<void> withdrawal() async {
    try {
      await FirebaseAuth.instance.currentUser?.delete();
      await signOut();
      return;
    } catch (error, stackTrace) {
      return Future.error(error, stackTrace);
    }
  }
}
