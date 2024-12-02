class QuizQuestion {
  const QuizQuestion(this.text, this.answers, [this.imageUrl]);

  final String text;
  final List<String> answers;
  final String? imageUrl;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
    
  }
}
