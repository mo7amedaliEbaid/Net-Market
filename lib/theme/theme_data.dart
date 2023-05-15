import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../const/global_constants.dart';

class Styles {

   ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      canvasColor: Colors.transparent,
      scaffoldBackgroundColor: isDarkTheme ? Colors.black54 : Colors.white,
      primaryColor: isDarkTheme ? Colors.deepPurple : Colors.blue,
      primarySwatch: isDarkTheme ? Colors.deepPurple : Colors.blue,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: isDarkTheme ? Colors.deepPurple : Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color:isDarkTheme ? Colors.blue:Colors.blue,
          size: 27,
        ),
        titleTextStyle:isDarkTheme ?lightThemetitleStyle:lightThemetitleStyle,
      ),
      iconTheme: IconThemeData(
        color:isDarkTheme ? Colors.blue:Colors.blue,
        size: 40,
      ),
      colorScheme: ThemeData().colorScheme.copyWith(
        secondary: isDarkTheme ? Colors.black54 : Colors.white,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      ),

      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 1))
      ),
      cardColor: isDarkTheme ? Colors.black54 : Colors.white,
     // canvasColor: isDarkTheme ? Colors.black : Colors.grey.shade50,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,

      )
    );
  }
}
