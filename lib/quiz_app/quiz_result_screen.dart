import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/quiz_app/models/quiz_questions.dart';
import 'package:my_app/quiz_app/questions_summary.dart';

import 'data/questions_data.dart';

class QuizResult extends StatelessWidget {
  const QuizResult(this.selectedAnswers , this.onPlayAgainClicked, {super.key});

  final List<String> selectedAnswers;
  final void Function() onPlayAgainClicked;

  List<QuizQuestion> calculateCorrectAnswers() {
    var answeredQuestions = questions.map((e) => e.setUserAnswer(selectedAnswers[questions.indexOf(e)])).toList();
    return answeredQuestions;
  }

  @override
  Widget build(BuildContext context) {
    var quizQuestions = calculateCorrectAnswers();
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered ${quizQuestions.where((element) => element.isCorrectAnswer).length} out of ${questions.length} questions correctly",
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60,
                ),
                textAlign: TextAlign.center),
            const SizedBox(height: 20),
            QuestionsSummary(quizQuestions),
            const SizedBox(height: 20),
            PlayAgainButton(onPlayAgainClicked: onPlayAgainClicked),
          ],
        ),
      ),
    );
  }
}

class PlayAgainButton extends StatelessWidget {
  const PlayAgainButton({
    super.key,
    required this.onPlayAgainClicked,
  });

  final void Function() onPlayAgainClicked;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.refresh),
      onPressed: () {
        onPlayAgainClicked();
      },
      style: TextButton.styleFrom(
        backgroundColor: Colors.deepPurpleAccent,
        textStyle: const TextStyle(fontSize: 20),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(20),
      ),
      label: const Text("Play Again"),
    );
  }
}
