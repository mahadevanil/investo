import 'package:flutter/material.dart';

class GlobalController with ChangeNotifier {
  //*------------------------(private avriables)
  bool _apiLoading = false;
  //*------------------------(Getters)
  bool get apiLoading => _apiLoading;
  //*------------------------(setters)
  changeApiLoading(bool loading) {
    _apiLoading = loading;
    notifyListeners();
  }
}
