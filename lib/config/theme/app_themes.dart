import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    colorScheme: const ColorScheme.dark(),
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'Roboto',
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.black,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  );
}
