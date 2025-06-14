import 'package:flutter/material.dart';

class StartQuizContent extends StatelessWidget {

  const StartQuizContent(this.pressStartQuiz, {super.key});

  final void Function() pressStartQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Opacity(
          opacity: 0.4,
          child: Image.asset('assets/images/quiz-logo.png', width: 200),
        ),
        SizedBox(height: 80),
        Text(
          "Learn Flutter the Fun way!",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        SizedBox(height: 18),
        OutlinedButton.icon(
          onPressed: pressStartQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          icon: Icon(Icons.arrow_right),
          label: const Text('Start Quiz'),
        ),
      ],
    );
  }
}
