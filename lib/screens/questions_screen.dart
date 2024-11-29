import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: SingleChildScrollView(
        // Make the entire layout scrollable
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display the image if it exists
              if (currentQuestion.imageUrl != null)
                Image.asset(
                  currentQuestion.imageUrl!,
                  height: MediaQuery.of(context).size.height *
                      0.3, // 30% of screen height
                  width: double.infinity,
                  fit: BoxFit.contain, // Ensure the image scales proportionally
                ),
              const SizedBox(height: 20), // Spacing below the image
              // Display the question text
              Text(
                currentQuestion.text,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30), // Spacing below the text
              // Display the answer options
              ...currentQuestion.getShuffledAnswers().map((answer) {
                return AnswerButton(
                  text: answer,
                  onTap: () {
                    answerQuestion(answer);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
