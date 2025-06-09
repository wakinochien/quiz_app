import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quiz_app/elevated_button.dart';
import 'package:quiz_app/models/sample_question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 1;

  void answerQuestion() {
    setState(() {
       currentQuestionIndex += 1;
    // currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.answers.map((answer) {
              return AnswerButton(text: answer, onTap: answerQuestion,);
            }),
          ],
        ),
      ),
    );
  }
}
