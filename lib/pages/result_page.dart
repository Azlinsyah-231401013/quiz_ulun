import 'package:flutter/material.dart';
import 'home_page.dart';

class ResultPage extends StatelessWidget {
  final String name;
  final String nim;
  final int correct;
  final int wrong;
  final int total;
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const ResultPage({
    super.key,
    required this.name,
    required this.nim,
    required this.correct,
    required this.wrong,
    required this.total,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    double score = (correct / total) * 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Quiz"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nama: $name", style: const TextStyle(fontSize: 18)),
              Text("NIM : $nim", style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              Text("Total Soal: $total", style: const TextStyle(fontSize: 18)),
              Text("Benar: $correct",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
              Text("Salah: $wrong",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red)),
              const SizedBox(height: 20),
              Text(
                "Skor Akhir: ${score.toStringAsFixed(1)}",
                style: const TextStyle(
                    fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomePage(
                        onToggleTheme: onToggleTheme,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.home),
                label: const Text("Kembali ke Home"),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
