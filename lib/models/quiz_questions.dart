class QuizQuestion {
  const QuizQuestion({
    required this.text,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  final String text;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      text: Uri.decodeComponent(json['question'] as String),
      correctAnswer: Uri.decodeComponent(json['correct_answer'] as String),
      incorrectAnswers: (json['incorrect_answers'] as List)
          .map((answer) => Uri.decodeComponent(answer as String))
          .toList(),
    );
  }

  List<String> get shuffledAnswers {
    final answers = [correctAnswer, ...incorrectAnswers];
    answers.shuffle();
    return answers;
  }
}
