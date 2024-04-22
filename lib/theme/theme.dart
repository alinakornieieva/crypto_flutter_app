import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  textTheme: const TextTheme(
      bodyLarge: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
      bodySmall: TextStyle(color: Colors.grey, fontSize: 18)),
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 183, 158, 58),
      background: Colors.black),
  useMaterial3: true,
);
