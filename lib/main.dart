import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz Ulun")),
      body: const Center(
        child: Text(
          "Selamat Datang di Quiz Ulun",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
