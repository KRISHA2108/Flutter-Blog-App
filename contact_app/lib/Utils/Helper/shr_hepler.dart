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
}
