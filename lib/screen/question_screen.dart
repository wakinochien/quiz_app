import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_questions.dart';
import 'package:quiz_app/screen/elevated_button.dart';
import 'package:quiz_app/screen/gradient_background.dart';
import 'package:quiz_app/screen/quiz_summary/result_screen.dart';
import 'package:quiz_app/services/quiz_service.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.playerName});

  final String playerName;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late final Future<List<QuizQuestion>> _questionsFuture;
  var currentQuestionIndex = 0;
  final selectedAnswers = <String>[];

  @override
  void initState() {
    super.initState();
    _questionsFuture = fetchQuizQuestions();
  }

  void answerQuestion(String answer, List<QuizQuestion> questions) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(
            playerName: widget.playerName,
            questions: questions,
            selectedAnswers: selectedAnswers,
          ),
        ),
      );
      return;
    }

    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: FutureBuilder<List<QuizQuestion>>(
          future: _questionsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Could not load quiz questions.\n${snapshot.error}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }

            final questions = snapshot.data!;
            final currentQuestion = questions[currentQuestionIndex];

            return SizedBox(
              width: double.infinity,
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      currentQuestion.text,
                      style: GoogleFonts.lato(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ...currentQuestion.shuffledAnswers.map((answer) {
                      return AnswerButton(
                        text: answer,
                        onTap: () => answerQuestion(answer, questions),
                      );
                    }),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
