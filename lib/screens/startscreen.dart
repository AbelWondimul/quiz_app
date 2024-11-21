import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/blue_lock.png',
            width: 350,
          ),
          const SizedBox(height: 80),
          const Text(
            'Blue Lock Quiz',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Color.fromARGB(255, 33, 32, 32),
                  offset: const Offset(2, 2),
                  blurRadius: 3,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: startQuiz,
            label: const Text('Start Quiz', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}