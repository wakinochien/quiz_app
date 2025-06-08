import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_content.dart';


class StartQuizBodyContainer extends StatelessWidget {

  const StartQuizBodyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blue , Colors.blueAccent]),
      ),
      child: Center(
          child: StartQuizContent()
      ),
    );
  }
}