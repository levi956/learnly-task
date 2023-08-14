import 'package:flutter/material.dart';
import 'package:rnly/app/shared/shared.dart';

class QuizOptionCard extends StatelessWidget {
  final String mainText;
  final IconData? icon;
  final String? subText;
  final Color? color;

  const QuizOptionCard({
    Key? key,
    required this.mainText,
    this.icon,
    this.subText,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: color ?? blue.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: white,
            size: 20,
          ),
          const SizedBox(height: 5),
          Text(
            mainText,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            subText ?? '',
          )
        ],
      ),
    );
  }
}
