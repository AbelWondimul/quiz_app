import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz_question.dart';

class QuizScreen extends StatelessWidget {
  final QuizQuestion question;

  const QuizScreen({required this.question, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display image if available
            if (question.imageUrl != null)
              Image.asset(
                question.imageUrl!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200, // Adjust the size as needed
              ),
            const SizedBox(height: 16),
            // Display question text
            Text(
              question.text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Display the answer options
            ...question.getShuffledAnswers().map((answer) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  child: Text(answer),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
