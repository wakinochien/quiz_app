import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/quiz_questions.dart';
import 'package:quiz_app/models/quiz_summary_item.dart';
import 'package:quiz_app/screen/gradient_background.dart';
import 'package:quiz_app/screen/quiz_summary/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.playerName,
    required this.questions,
    required this.selectedAnswers,
  });

  final String playerName;
  final List<QuizQuestion> questions;
  final List<String> selectedAnswers;

  List<QuizSummaryItem> get summaryData {
    return [
      for (var i = 0; i < selectedAnswers.length; i++)
        QuizSummaryItem(
          questionIndex: i,
          question: questions[i].text,
          correctAnswer: questions[i].correctAnswer,
          userAnswer: selectedAnswers[i],
        ),
    ];
  }

  void _restart(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((item) => item.isCorrectAnswer)
        .length;

    return Scaffold(
      body: GradientBackground(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Nice job, $playerName! You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 230, 200, 253),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                QuestionsSummary(summaryData),
                const SizedBox(height: 30),
                TextButton.icon(
                  onPressed: () => _restart(context),
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Restart Quiz!'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
