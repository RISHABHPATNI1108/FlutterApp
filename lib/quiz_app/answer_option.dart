import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {
  const AnswerOption(this.answerText, this.onAnswerSelected, {super.key});

  final String answerText;
  final void Function(String) onAnswerSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton(
        onPressed: () {
          onAnswerSelected(answerText);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black54,
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          textStyle: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        child: Text(
          answerText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
