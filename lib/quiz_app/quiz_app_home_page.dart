import 'package:flutter/material.dart';
import 'package:my_app/quiz_app/data/questions_data.dart';
import 'package:my_app/quiz_app/quiz_home_screen.dart';
import 'package:my_app/quiz_app/quiz_question.dart';
import 'package:my_app/quiz_app/quiz_result_screen.dart';
import '../utils/gradient_container.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  Widget? currentScreen;

  void updateCurrentPage() {
    setState(() {
      selectedAnswers.clear();
      currentScreen = QuestionsScreen(updateSelectedAnswers);
    });
  }

  void updateSelectedAnswers(String answer) {
    setState(() {
      selectedAnswers.add(answer);
      if (selectedAnswers.length == questions.length) {
        currentScreen = QuizResult(selectedAnswers, updateCurrentPage);
      }
    });
  }

  @override
  void initState() {
    currentScreen = QuizAppHomePage(updateCurrentPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradiantContainer(
        currentScreen,
        colors: const [Colors.deepPurple, Colors.deepPurple],
      ),
    );
  }
}
