import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_system/pages/Home/view/home_page.dart';
import 'package:login_system/pages/Login/login_page.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const LoginPage(),
    '/home': (context) => const HomePage(),
  };
}
