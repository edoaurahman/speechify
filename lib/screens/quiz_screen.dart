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
      text:
          'Bunyi yang dihasilkan dari rongga kerongkongan yang digunakan sebagai tabung udara lalu kepita suara disebut?',
      choices: [
        'A. Bunyi Farigal',
        'B. Bunyi nasal',
        'C. Bunyi Laminoalveloar'
      ],
      correctChoiceIndex: 0,
    ),
    Question(
      text: 'Apa nama bunyi yang keluar melalui rongga hidung?',
      choices: ['A. Bunyi Oral', 'B. Bunyi Nasal', 'C. Bunyi Bahasa'],
      correctChoiceIndex: 1,
    ),
    Question(
      text:
          'Dalam pembentukan bunyi bahasa, yang berlaku sebagai artikulator pasif adalah....',
      choices: [
        'A. Langit-langit keras',
        'B. Ujung lidah',
        'C. Langit-langit lunak'
      ],
      correctChoiceIndex: 0,
    ),
    Question(
      text: 'Bunyi yang dihasilkan oleh alveolum dan apeks disebut bunyi...',
      choices: ['A. Laminoalveolar', 'B. Nasal', 'C. Apikoalveolar'],
      correctChoiceIndex: 2,
    ),
    Question(
      text: 'Tempat masuknya udara menuju tenggorokan adalah...',
      choices: ['A. Bibir atas', 'B. Ceruk gigi', 'C. Rongga hidung'],
      correctChoiceIndex: 2,
    ),
    Question(
      text: 'Rongga mulut memiliki fungsi untuk...',
      choices: ['A. Menggigit', 'B. Mengunyah', 'C. Menjaga kelembaban'],
      correctChoiceIndex: 1,
    ),
    Question(
      text: 'Bunyi yang dihasilkan pada alat ucap rongga mulut disebut?',
      choices: ['A. Bunyi Nasal', 'B. Bunyi Oral', 'C. Bunyi Bahasa'],
      correctChoiceIndex: 1,
    ),
    Question(
      text: 'Arus udara yang datang dari dalam paru-paru disebut?',
      choices: [
        'A. Arus Udara Egresif',
        'B. Farigal',
        'C. Arus Udara Ingresif'
      ],
      correctChoiceIndex: 0,
    ),
    Question(
      text:
          'Bagaimana cara bunyi nasal dihasilkan pada alat ucap rongga hidung?',
      choices: [
        'A. Dihasilkan oleh gigi atas dan bibir bawah',
        'B. Dengan melalui rongga mulut',
        'C. Dengan cara menutup rapat-rapat arus udara di rongga mulut dan menyalurkan keluar melalui rongga hidung'
      ],
      correctChoiceIndex: 2,
    ),
    Question(
      text:
          'Organ di dalam tubuh manusia yang menghasilkan suara adalah',
      choices: [
        'A. Paru-paru',
        'B. Lidah',
        'C. Ginjal'
      ],
      correctChoiceIndex: 1,
    ),
    Question(
      text:
          'Bagian tubuh manusia yang terlibat dalam alat ucap adalah',
      choices: [
        'A. Paru-paru dan lambung',
        'B. Otak dan jantung',
        'C. Lidah dan gigi'
      ],
      correctChoiceIndex: 2,
    ),
    Question(
      text:
          'Celah atau ruang diantara sepasang pita suara disebut',
      choices: [
        'A. Krikoid',
        'B. Glotis',
        'C. Tiroid'
      ],
      correctChoiceIndex: 0,
    ),
    Question(
      text:
          'Sumber utama energi dalam bunyi dalam bahasa adalah udara yang berasal dari',
      choices: [
        'A. Paru-paru',
        'B. Perut',
        'C. Pita suara'
      ],
      correctChoiceIndex: 0,
    ),
    Question(
      text:
          'Artikulasi apikodental terjadi antara...',
      choices: [
        'A. Bibir bawah dan bibir atas',
        'B. Daun lidah dan gigi atas',
        'C. Ujung lidah dan gigi atas'
      ],
      correctChoiceIndex: 1,
    ),
    Question(
      text:
          'Nama Latin dari anak tekak adalah',
      choices: [
        'A. Apek',
        'B. Cricoid',
        'C. Uvula'
      ],
      correctChoiceIndex: 2,
    ),
    Question(
      text:
          'Bunyi-bunyi bahasa dapat dihasilkan jika',
      choices: [
        'A. Mendeskripsikan kaidah kaidah fonem',
        'B. Menentukan objek kajian bunyi yang membedakan makna fonem',
        'C. Udara dari paru-paru dihembuskan dan kedua pita suara merenggang atau merapat'
      ],
      correctChoiceIndex: 2,
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
        centerTitle: true,
        title: const Text('Quiz'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ResizeImage(
              AssetImage('assets/images/quiz.webp'),
              height: 1080,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
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
                      ],
                    ),
                  ),
                ),
              ),
              Column(
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
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(
                            const Size(double.infinity, 40),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(choice),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ],
          ),
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

  const ScoreScreen(
      {super.key, required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Score'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ResizeImage(
              AssetImage('assets/images/quiz.webp'),
              height: 1080,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: IntrinsicHeight(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Skor Akhir',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Score: $score dari $totalQuestions pertanyaan',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
