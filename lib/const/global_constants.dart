import 'package:flutter/material.dart';
TextStyle lightThemetitleStyle=TextStyle(
  fontWeight:FontWeight.w600,
  fontSize: 20,
  color: Colors.blue,
);
TextStyle bigwhite=TextStyle(
  fontWeight:FontWeight.w600,
  fontSize: 20,
  color: Colors.white,
);
TextStyle normalwhite=TextStyle(
  fontWeight:FontWeight.w600,
  fontSize: 16,
  color: Colors.white,
);
TextStyle lightThemenormalStyle=TextStyle(
  fontWeight:FontWeight.w500,
  fontSize: 18,
  color: Colors.blue,
);
TextStyle underlinedTitle=TextStyle(
  fontWeight:FontWeight.w600,
  fontSize: 20,
//  color: Colors.blue,
  shadows: [
    Shadow(
        color: Colors.blue,
        offset: Offset(0, -10)),
  ],
  color: Colors.transparent,
  decoration:
  TextDecoration.underline,
  decorationColor: Colors.blue,
  decorationThickness: 4,
  decorationStyle:
  TextDecorationStyle.solid,
);
TextStyle greenStyle=TextStyle(
  fontWeight:FontWeight.w600,
  fontSize: 18,
  color: Colors.green,
);
TextStyle oldpriceStyle=TextStyle(
  fontWeight:FontWeight.bold,
  fontSize: 17,
  color: Colors.blue,
  decoration: TextDecoration.lineThrough,
  decorationStyle: TextDecorationStyle.solid,
  decorationThickness: 2
);