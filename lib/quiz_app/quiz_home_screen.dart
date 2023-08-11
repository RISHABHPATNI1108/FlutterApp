import 'package:flutter/material.dart';

class QuizAppHomePage extends StatelessWidget {
  const QuizAppHomePage(this.startQuizPressed, {super.key});

  final void Function() startQuizPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            opacity: const AlwaysStoppedAnimation(0.5),
          ),
          const SizedBox(height: 40),
          Text("Learn Flutter the fun way!",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            icon: const Icon(Icons.play_arrow),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              textStyle: const TextStyle(fontSize: 20),
              side: const BorderSide(color: Colors.black, width: 1),
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
            ),
            onPressed: () {
              startQuizPressed();
            },
            label: const Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}
