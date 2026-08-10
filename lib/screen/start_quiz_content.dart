import 'package:flutter/material.dart';

class StartQuizContent extends StatefulWidget {
  const StartQuizContent(this.onStartQuiz, {super.key});

  final void Function(String playerName) onStartQuiz;

  @override
  State<StartQuizContent> createState() => _StartQuizContentState();
}

class _StartQuizContentState extends State<StartQuizContent> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onStartQuiz(_nameController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.4,
            child: Image.asset('assets/images/quiz-logo.png', width: 200),
          ),
          const SizedBox(height: 40),
          const Text(
            'Learn Flutter the Fun way!',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextFormField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Your name',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your name first';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 18),
          OutlinedButton.icon(
            onPressed: _submit,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 28),
            ),
            icon: const Icon(Icons.arrow_right),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
