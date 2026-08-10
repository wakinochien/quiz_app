import 'package:flutter/material.dart';
import 'package:quiz_app/screen/gradient_background.dart';
import 'package:quiz_app/screen/question_screen.dart';
import 'package:quiz_app/screen/start_quiz_content.dart';

class StartQuizScreen extends StatelessWidget {
  const StartQuizScreen({super.key});

  void _startQuiz(BuildContext context, String playerName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionScreen(playerName: playerName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: StartQuizContent(
          (playerName) => _startQuiz(context, playerName),
        ),
      ),
    );
  }
}
