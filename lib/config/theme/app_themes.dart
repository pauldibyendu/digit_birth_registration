import 'dart:ui';

import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    appBarTheme: appBarTheme()
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
    titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
  );
}

TextStyle label() {
  return const TextStyle(
      fontSize: 14, // Adjust as per your requirement
      color: Colors.black, // Adjust as per your requirement
  );
}

TextStyle subLabel() {
  return const TextStyle(
    fontSize: 14, // Adjust as per your requirement
    color: Colors.black, // Adjust as per your requirement
  );
}

TextStyle bold() {
  return const TextStyle(
    fontWeight: FontWeight.bold,
    height: 2// Adjust as per your requirement
  );
}

TextStyle normal() {
  return const TextStyle(
    fontWeight: FontWeight.normal,
    height: 2// Adjust as per your requirement
  );
}