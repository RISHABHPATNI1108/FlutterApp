import 'package:flutter/material.dart';

import 'answer_option.dart';
import 'data/questions_data.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onAnswerSelected, {super.key});

  final void Function(String) onAnswerSelected;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    setState(() {
      if (currentQuestionIndex <= questions.length - 1) {
        currentQuestionIndex++;
        widget.onAnswerSelected(answer);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var question = questions[currentQuestionIndex];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(question.question,
            style: GoogleFonts.lato(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white60,
            ),
            textAlign: TextAlign.center),
        const SizedBox(height: 20),
        ...question
            .getShuffledAnswers()
            .map((e) => AnswerOption(e, answerQuestion)),
      ],
    );
  }
}
