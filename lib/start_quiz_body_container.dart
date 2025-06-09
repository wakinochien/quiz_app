import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_quiz_content.dart';

class StartQuizBodyContainer extends StatefulWidget {
  const StartQuizBodyContainer({super.key});

  @override
  State<StartQuizBodyContainer> createState() {
    return _StartQuizBodyContainerState();
  }
}

class _StartQuizBodyContainerState extends State<StartQuizBodyContainer> {
  String activeScreen = "start_quiz_screen";

  void pressStartQuiz() {
    setState(() {
      activeScreen = "question_screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidget = activeScreen == "start_quiz_screen"
        ? StartQuizContent(pressStartQuiz)
        : QuestionScreen();
    Widget screenWidget2 = StartQuizContent(pressStartQuiz);

    if (activeScreen == "question_screen") {
      screenWidget2 = QuestionScreen();
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blue, Colors.blueAccent]),
      ),
      child: Center(child: screenWidget2),
    );
  }
}
