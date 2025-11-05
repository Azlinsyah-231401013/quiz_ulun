import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/quiz_page.dart';
import 'pages/result_page.dart';

void main() => runApp(const QuizUlunApp());

class QuizUlunApp extends StatefulWidget {
  const QuizUlunApp({super.key});

  @override
  State<QuizUlunApp> createState() => _QuizUlunAppState();
}

class _QuizUlunAppState extends State<QuizUlunApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Ulun',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.indigo, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: HomePage(
        onToggleTheme: toggleTheme,
        isDarkMode: _themeMode == ThemeMode.dark,
      ),
    );
  }
}
