import 'package:flutter/material.dart';

class GradiantContainer extends StatelessWidget {
  const GradiantContainer(this.child, {super.key, this.colors = const []});

  const GradiantContainer.purple(this.child, {super.key , this.colors = const [Colors.deepPurpleAccent, Colors.deepPurple]});

  final Widget? child;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
