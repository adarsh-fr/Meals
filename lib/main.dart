import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/screens/tabs.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 146, 247, 5)
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 0, 14, 0),
  brightness: Brightness.dark,
);
void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: kDarkColorScheme,
          cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            //shape:
              //  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            //shadowColor: const Color.fromARGB(255, 12, 73, 227),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer,
            ),
          ),
        ),
        theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: Colors.white,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            //shadowColor: const Color.fromARGB(255, 12, 73, 227),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
              //foregroundColor: Colors.white,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge:  TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kColorScheme.onSecondaryContainer,
                    fontSize: 24),
              ),
        ),
        themeMode: ThemeMode.system,
        home: const TabScreen(),
      ),
    ),
  );
}