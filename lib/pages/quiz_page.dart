import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  final String name;
  final String nim;

  const QuizPage({super.key, required this.name, required this.nim});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz Page")),
      body: Center(
        child: Text("Hai $name ($nim), selamat datang di Quiz!"),
      ),
    );
  }
}
