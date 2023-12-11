import 'package:nendoroid_db/utilities/app_font.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preference_provider.g.dart';

@Riverpod(keepAlive: true)
SharedPreferencesManager sharedPreferences(SharedPreferencesRef ref) {
  throw UnimplementedError();
}

class SharedPreferencesManager {
  SharedPreferencesManager(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  String getFont() {
    return _sharedPreferences.getString(AppFont.appFont) ?? AppFont.oneMobile;
  }

  Future<void> setFont(String appFont) async {
    await _sharedPreferences.setString(AppFont.appFont, appFont);
  }
}