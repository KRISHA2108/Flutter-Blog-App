import 'package:blog_app/header.dart';

class Constants {
  static Color backgroundColor = const Color.fromARGB(255, 144, 202, 249);
  static Color backgroundColor2 = const Color.fromARGB(255, 46, 75, 150);
  static Color primaryColor = const Color.fromARGB(255, 141, 107, 198);
  static String defaultText =
      r'[{"insert":"edit content...","attributes":{"color":"#FF757575"}},{"insert":"\n"}]';

  static RegExp emailValidationRegex =
      RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

  static RegExp passwordValidationRegex =
      RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");

  static RegExp nameValidationRegex = RegExp(r"\b([A-ZÀ-ÿ][-,a-z. ']+[ ]*)+");

  static Color drawerTilesColor = const Color(0xFF414755);
  static Color drawerBackground = const Color.fromARGB(226, 124, 192, 248);
}
