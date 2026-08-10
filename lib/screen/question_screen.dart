import 'package:flutter/material.dart';
import 'package:quiz_app/screen/elevated_button.dart';
import 'package:quiz_app/models/sample_question.dart';
import 'package:quiz_app/screen/gradient_background.dart';
import 'package:quiz_app/screen/quiz_summary/result_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.playerName});

  final String playerName;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  final selectedAnswers = <String>[];

  void answerQuestion(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(
            playerName: widget.playerName,
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
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      body: GradientBackground(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuestion.text,
                  style: GoogleFonts.lato(fontSize: 24, color: Colors.white),
                ),
                const SizedBox(height: 30),
                ...currentQuestion.shuffledAnswers.map((answer) {
                  return AnswerButton(
                    text: answer,
                    onTap: () => answerQuestion(answer),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
