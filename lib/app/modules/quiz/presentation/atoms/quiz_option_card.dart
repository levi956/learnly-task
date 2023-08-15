import 'package:flutter/material.dart';
import 'package:rnly/app/shared/shared.dart';

class QuizOptionCard extends StatelessWidget {
  final String mainText;

  const QuizOptionCard({
    Key? key,
    required this.mainText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      margin: const EdgeInsets.all(Spacings.spacing10),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: blue.withOpacity(0.2),
        borderRadius: BorderRadius.circular(Spacings.spacing10),
      ),
      child: Center(
        child: Text(
          mainText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
