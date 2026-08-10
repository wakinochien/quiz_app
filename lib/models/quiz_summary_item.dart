class QuizSummaryItem {
  const QuizSummaryItem({
    required this.questionIndex,
    required this.question,
    required this.correctAnswer,
    required this.userAnswer,
  });

  final int questionIndex;
  final String question;
  final String correctAnswer;
  final String userAnswer;

  bool get isCorrectAnswer => userAnswer == correctAnswer;
}
