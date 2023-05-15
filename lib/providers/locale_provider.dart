import 'package:flutter/material.dart';

class LocaleCont extends ChangeNotifier {
  Locale locale = Locale('en', "US");
  updateLocale(Locale a) {
    locale = a;
    notifyListeners();
  }
}