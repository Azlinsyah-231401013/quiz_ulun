import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() => runApp(const QuizUlunApp());

class QuizUlunApp extends StatelessWidget {
  const QuizUlunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Ulun',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light, // ✅ tambahkan ini
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark, // ✅ tambahkan ini juga
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
