import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../prefs/darkthemeprefs.dart';
class DarkThemeProvider with ChangeNotifier{
  DarkThemePrefs darkThemePrefs=DarkThemePrefs();
  static const THEME_STATUS = 'THEMESTATUS';
   bool getdarkTheme=false;
 // bool get getDarkTheme=> _darkTheme;*/
  /* set setDarkTheme(bool value){
     _darkTheme=value;
     darkThemePrefs.setDarkTheme(value);
     notifyListeners();
   }*/
  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    getdarkTheme= prefs.getBool(THEME_STATUS)??false;
    return getdarkTheme;
  }
}