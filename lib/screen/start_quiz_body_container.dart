import 'package:flutter/material.dart';
import 'package:quiz_app/models/sample_question.dart';
import 'package:quiz_app/screen/question_screen.dart';
import 'package:quiz_app/screen/quiz_summary/result_screen.dart';
import 'package:quiz_app/screen/start_quiz_content.dart';

class StartQuizBodyContainer extends StatefulWidget {
  const StartQuizBodyContainer({super.key});

  @override
  State<StartQuizBodyContainer> createState() {
    return _StartQuizBodyContainerState();
  }
}

class _StartQuizBodyContainerState extends State<StartQuizBodyContainer> {
  String activeScreen = "start_quiz_screen";
  List<String>  selectAnswers = [];

  void pressStartQuiz() {
    setState(() {
      activeScreen = "question_screen";
    });
  }

  void chooseAnwser(String answer) {
    selectAnswers.add(answer);
    if (selectAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result_screen";
      });
    }
  }


    void onRestart() {
    if (selectAnswers.length == questions.length) {
      selectAnswers = [];
      setState(() {
        activeScreen = "start_quiz_screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidget = activeScreen == "start_quiz_screen"
    //     ? StartQuizContent(pressStartQuiz)
    //     : QuestionScreen();
    Widget screenWidget2 = StartQuizContent(pressStartQuiz);

    if (activeScreen == "question_screen") {
      screenWidget2 = QuestionScreen(onSelectAnswer: chooseAnwser);
    }else if (activeScreen == "result_screen"){
          screenWidget2 = ResultsScreen(selectAnswers: selectAnswers,onRestart: onRestart,);
    }

    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.blue, Colors.blueAccent])),
      child: Center(child: screenWidget2),
    );
  }
}
