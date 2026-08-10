import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_summary_item.dart';
import 'package:quiz_app/screen/quiz_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<QuizSummaryItem> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((item) {
            return SummaryItem(item);
          }).toList(),
        ),
      ),
    );
  }
}
