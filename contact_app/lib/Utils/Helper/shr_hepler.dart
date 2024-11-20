import 'package:shared_preferences/shared_preferences.dart';

class ShrIntroHelper {
  introShown() async {
    SharedPreferences intro = await SharedPreferences.getInstance();
    await intro.setBool('isIntroShown', true);
  }

  Future<bool?> isIntroShown() async {
    SharedPreferences intro = await SharedPreferences.getInstance();

    bool? status = intro.getBool('isIntroShown');
    return status;
  }

  profileShown() async {
    SharedPreferences profile = await SharedPreferences.getInstance();
    await profile.setBool('isProfileShown', true);
  }

  Future<bool?> isProfileShown() async {
    SharedPreferences profile = await SharedPreferences.getInstance();

    bool? status = profile.getBool('isProfileShown');
    return status;
  }
}
