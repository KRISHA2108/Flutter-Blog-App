import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int i = 1;

  void increment() {
    i++;
    notifyListeners();
  }

  void decrement() {
    i--;
    notifyListeners();
  }

  void x2() {
    i = i * 2;
    notifyListeners();
  }

  void x3() {
    i = i * 3;
    notifyListeners();
  }

  void x4() {
    i = i * 4;
    notifyListeners();
  }

  void reset() {
    i = 1;
    notifyListeners();
  }
}
