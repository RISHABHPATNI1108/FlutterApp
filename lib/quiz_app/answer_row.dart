
import 'package:flutter/material.dart';
import 'data/questions_data.dart';
import 'models/quiz_questions.dart';

class AnswerRow extends StatelessWidget {
  const AnswerRow(this.element , {
    super.key,
  });

  final QuizQuestion element;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            shape: const CircleBorder(),
            color: element.isCorrectAnswer
                ? Colors.green
                : Colors.red,
          ),
          child: Text(
            questions.indexOf(element).toString(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                element.question,
                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                element.userAnswer,
                style: const TextStyle(color: Colors.blue),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 2),
              Text(
                element.answers[0],
                style: const TextStyle(color: Colors.green),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
