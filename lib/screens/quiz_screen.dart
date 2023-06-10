import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;

  List<Question> questions = [
    Question(
      text: 'Pertanyaan 1: Apa ibu kota Indonesia?',
      choices: ['A. Jakarta', 'B. Bandung', 'C. Surabaya', 'D. Medan'],
      correctChoiceIndex: 0,
    ),
    Question(
      text: 'Pertanyaan 2: Siapakah presiden pertama Indonesia?',
      choices: [
        'A. Soekarno',
        'B. Soeharto',
        'C. Joko Widodo',
        'D. Megawati Soekarnoputri'
      ],
      correctChoiceIndex: 0,
    ),
    // Tambahkan pertanyaan lainnya sesuai kebutuhan
  ];

  void answerQuestion(int selectedChoiceIndex) {
    if (selectedChoiceIndex ==
        questions[currentQuestionIndex].correctChoiceIndex) {
      setState(() {
        score += 100 ~/ questions.length;
      });
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // Navigasi ke layar skor jika sudah menjawab semua pertanyaan
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ScoreScreen(score: score, totalQuestions: questions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pertanyaan ${currentQuestionIndex + 1}/${questions.length}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              questions[currentQuestionIndex].text,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...questions[currentQuestionIndex].choices.map((choice) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        answerQuestion(questions[currentQuestionIndex]
                            .choices
                            .indexOf(choice));
                      },
                      child: Text(choice),
                    ),
                  );
                }).toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String text;
  final List<String> choices;
  final int correctChoiceIndex;

  Question({
    required this.text,
    required this.choices,
    required this.correctChoiceIndex,
  });
}

class ScoreScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ScoreScreen({super.key, required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Score'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Skor Akhir',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Score: $score dari $totalQuestions pertanyaan',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
