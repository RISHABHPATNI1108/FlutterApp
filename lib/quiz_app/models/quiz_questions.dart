class QuizQuestion {
  QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;
  bool isCorrectAnswer = false;
  String userAnswer = "";

  QuizQuestion setUserAnswer(String answer) {
    userAnswer = answer;
    isCorrectAnswer = isAnswerCorrect();
    return this;
  }

  List<String> getShuffledAnswers() {
    return answers.toList()..shuffle();
  }

  bool isAnswerCorrect() {
    return answers.first == userAnswer;
  }
}
