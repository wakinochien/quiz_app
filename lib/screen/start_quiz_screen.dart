import 'package:flutter/material.dart';
import 'package:quiz_app/screen/start_quiz_body_container.dart';

class StartQuizScreen extends StatefulWidget {
  const StartQuizScreen({super.key});
  @override
  State<StartQuizScreen> createState() {
    return _StartQuizScreenState();
  }
}

class _StartQuizScreenState extends State<StartQuizScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: StartQuizBodyContainer()));
  }
}
