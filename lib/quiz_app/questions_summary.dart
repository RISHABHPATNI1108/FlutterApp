import 'package:flutter/material.dart';
import 'package:my_app/quiz_app/models/quiz_questions.dart';

import 'answer_row.dart';
import 'data/questions_data.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.answeredQuestions, {super.key});

  final List<QuizQuestion> answeredQuestions;

  @override
  Widget build(context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: answeredQuestions
              .map(
                (element) => Column(
                  children: [
                    AnswerRow(element),
                    if (questions.last != element) const DividerWidget()
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 10),
        Divider(color: Colors.white60),
        SizedBox(height: 10),
      ],
    );
  }
}
