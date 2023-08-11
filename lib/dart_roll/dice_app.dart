import 'dart:math';

import 'package:flutter/material.dart';
import '../utils/gradient_container.dart';


class DiceApp extends StatefulWidget {
  const DiceApp({super.key});

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {

  var randomNumber = 0;
  final _random = Random();

  void setRandom() {
    randomNumber = _random.nextInt(6);
  }

  String getRandomImage() {
    return "assets/images/dice-${randomNumber + 1}.png";
  }

  void rollDice() {
    setState(setRandom);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GradiantContainer.purple(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                getRandomImage(),
                width: 200,
              ),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: rollDice,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Text("Roll Dice")),
            ],
          ),
        ),
      );
  }
}

