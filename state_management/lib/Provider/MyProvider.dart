import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier {
  int counter = 0;
  bool _showDebug = false;
  void increment() {
    counter++;
    notifyListeners();
  }

  set setShowDebug(bool val) {
    _showDebug = val;
    notifyListeners();
  }

  void changeShowDebug(bool val) {
    _showDebug = val;
    notifyListeners();
  }

  bool get showDebug => _showDebug;
}

class MyProvider2 with ChangeNotifier {
  int counter = 0;
  bool _showDebug = false;
  void increment() {
    counter++;
    notifyListeners();
  }

  set setShowDebug(bool val) {
    _showDebug = val;
    notifyListeners();
  }

  void changeShowDebug(bool val) {
    _showDebug = val;
    notifyListeners();
  }

  bool get showDebug => _showDebug;
}
