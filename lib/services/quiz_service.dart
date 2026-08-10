import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/models/quiz_questions.dart';

Future<List<QuizQuestion>> fetchQuizQuestions({
  int amount = 10,
  int category = 18,
  String difficulty = 'easy',
  String type = 'multiple',
}) async {
  final response = await http.get(
    Uri.parse(
      'https://opentdb.com/api.php'
      '?amount=$amount&category=$category&difficulty=$difficulty&type=$type&encode=url3986',
    ),
  );

  if (response.statusCode != 200) {
    throw Exception(
      'Failed to load quiz questions (status ${response.statusCode})',
    );
  }

  final data = jsonDecode(response.body) as Map<String, dynamic>;
  final responseCode = data['response_code'] as int;
  if (responseCode != 0) {
    throw Exception('Open Trivia DB returned response_code $responseCode');
  }

  final results = data['results'] as List;
  return results
      .map((json) => QuizQuestion.fromJson(json as Map<String, dynamic>))
      .toList();
}
