import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int _count = 0;
  int get getCounter {
    return _count;
  }
  void incrementCounter() {
    _count++;
    notifyListeners();
  }

}