import 'package:flutter/cupertino.dart';

class ProfileProvider with ChangeNotifier {
  bool isDark = true;
  bool isAndroid = true;

  void changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }

  void checkPlatform(bool val) {
    isAndroid = val;
    notifyListeners();
  }
}
