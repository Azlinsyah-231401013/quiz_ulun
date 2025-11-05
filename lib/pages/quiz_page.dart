import 'package:flutter/material.dart';
import 'result_page.dart';

class QuizPage extends StatefulWidget {
  final String name;
  final String nim;
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const QuizPage({
    super.key,
    required this.name,
    required this.nim,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentIndex = 0;
  List<String?> userAnswers = [];

  final List<Map<String, dynamic>> questions = [
    {
      "question": "Ibukota negara Jepang adalah?",
      "options": ["Seoul", "Beijing", "Tokyo", "Bangkok", "Manila"],
      "answer": "Tokyo",
    },
    {
      "question": "Siapakah penemu lampu pijar?",
      "options": ["Isaac Newton", "Albert Einstein", "Nikola Tesla", "Thomas Edison", "Alexander Graham Bell"],
      "answer": "Thomas Edison",
    },
    {
      "question": "Gunung tertinggi di dunia adalah?",
      "options": ["Kilimanjaro", "Everest", "Elbrus", "Aconcagua", "Fuji"],
      "answer": "Everest",
    },
    {
      "question": "Planet terdekat dari matahari adalah?",
      "options": ["Bumi", "Venus", "Mars", "Merkurius", "Jupiter"],
      "answer": "Merkurius",
    },
    {
      "question": "Siapa presiden pertama Indonesia?",
      "options": ["Soeharto", "Ir. Soekarno", "B.J. Habibie", "Megawati", "Gus Dur"],
      "answer": "Ir. Soekarno",
    },
  ];

  @override
  void initState() {
    super.initState();
    userAnswers = List.filled(questions.length, null);
  }

  void selectAnswer(String option) {
    setState(() {
      userAnswers[currentIndex] = option;
    });
  }

  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      setState(() => currentIndex++);
    } else {
      int correct = 0;
      int wrong = 0;
      for (int i = 0; i < questions.length; i++) {
        if (userAnswers[i] == questions[i]["answer"]) correct++;
        else if (userAnswers[i] != null) wrong++;
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultPage(
            name: widget.name,
            nim: widget.nim,
            correct: correct,
            wrong: wrong,
            total: questions.length,
            onToggleTheme: widget.onToggleTheme,
            isDarkMode: widget.isDarkMode,
          ),
        ),
      );
    }
  }

  void previousQuestion() {
    if (currentIndex > 0) {
      setState(() => currentIndex--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final question = questions[currentIndex];
    final selected = userAnswers[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Umum - ${widget.name} (${widget.nim})"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: (currentIndex + 1) / questions.length,
              color: colorScheme.primary,
              backgroundColor: colorScheme.primaryContainer.withOpacity(0.3),
            ),
            const SizedBox(height: 20),
            Text(
              "Soal ${currentIndex + 1} dari ${questions.length}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              question["question"],
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 Pilihan jawaban (semua hijau saat dipilih)
            ...question["options"].map<Widget>((option) {
              bool isSelected = option == selected;

              return Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                  onPressed: () => selectAnswer(option),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected
                        ? Colors.green.shade600
                        : (widget.isDarkMode
                            ? colorScheme.surfaceVariant.withOpacity(0.3)
                            : Colors.grey.shade100),
                    foregroundColor:
                        isSelected ? Colors.white : colorScheme.onBackground,
                    padding: const EdgeInsets.all(14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: isSelected
                            ? Colors.green.shade700
                            : Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      option,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              );
            }).toList(),

            const Spacer(),

            // 🔹 Tombol navigasi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentIndex > 0)
                  ElevatedButton.icon(
                    onPressed: previousQuestion,
                    icon: const Icon(Icons.arrow_back),
                    label: const Text("Sebelumnya"),
                  )
                else
                  const SizedBox(width: 140),
                ElevatedButton.icon(
                  onPressed: nextQuestion,
                  icon: Icon(currentIndex < questions.length - 1
                      ? Icons.arrow_forward
                      : Icons.check),
                  label: Text(currentIndex < questions.length - 1
                      ? "Selanjutnya"
                      : "Selesai"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
