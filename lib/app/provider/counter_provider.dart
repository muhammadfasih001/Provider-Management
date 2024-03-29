import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void countIncrement() {
    _count++;
    notifyListeners();
  }

  void countDecrement() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }
}
