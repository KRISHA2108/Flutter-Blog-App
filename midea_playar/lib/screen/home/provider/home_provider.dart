import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  double rangeSlider = 0;

  void setRangeSlider(double value) {
    rangeSlider = value;
    notifyListeners();
  }
}
