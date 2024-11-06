import 'package:flutter/material.dart';

import 'widgets/expenses.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
          headlineSmall: TextStyle(
              fontSize: 20.0, fontStyle: FontStyle.italic, color: Colors.black),
          bodyMedium: TextStyle(
              fontSize: 14.0, fontFamily: 'Hind', color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          labelStyle: TextStyle(color: Colors.blue),
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          shadowColor: Colors.grey.withOpacity(0.5),
          elevation: 5,
          margin: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue, brightness: Brightness.dark),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
          headlineSmall: TextStyle(
              fontSize: 20.0, fontStyle: FontStyle.italic, color: Colors.white),
          bodyMedium: TextStyle(
              fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          labelStyle: TextStyle(color: Colors.blue),
        ),
        cardTheme: CardTheme(
          color: Colors.grey[800],
          shadowColor: Colors.black.withOpacity(0.5),
          elevation: 5,
          margin: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      themeMode: _themeMode, // Use the current theme mode
      home: Scaffold(
        body: const Expenses(),
        bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).appBarTheme.backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _themeMode == ThemeMode.light ? 'Light Mode' : 'Dark Mode',
                  style: TextStyle(
                    color: Theme.of(context).appBarTheme.foregroundColor,
                    fontSize: 18,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  _themeMode == ThemeMode.light
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  color: Theme.of(context).appBarTheme.foregroundColor,
                ),
                onPressed: _toggleTheme,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
