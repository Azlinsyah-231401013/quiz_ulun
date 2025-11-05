import 'package:flutter/material.dart';
import 'quiz_page.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const HomePage({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _name = TextEditingController();
  final _nim = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Ulun"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Masukkan Identitas Kamu",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _name,
              decoration: const InputDecoration(
                labelText: "Nama Lengkap",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _nim,
              decoration: const InputDecoration(
                labelText: "NIM",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_name.text.isEmpty || _nim.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Nama & NIM wajib diisi")),
                  );
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuizPage(
                      name: _name.text,
                      nim: _nim.text,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              ),
              child: const Text(
                "Mulai Math Quiz",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
