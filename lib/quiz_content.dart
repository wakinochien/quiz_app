import 'package:flutter/material.dart';

class StartQuizContent extends StatefulWidget {
  @override
  State<StartQuizContent> createState() {
    return _StartQuizContentState();
  }
}

class _StartQuizContentState extends State<StartQuizContent> {
  void pressStartQuiz() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/quiz-logo.png', width: 200),
        SizedBox(height: 16),
        OutlinedButton(
          onPressed: pressStartQuiz,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text('Start Quiz'),
        ),
      ],
    );
  }
}
