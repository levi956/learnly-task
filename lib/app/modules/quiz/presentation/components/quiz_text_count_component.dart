import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rnly/app/modules/quiz/domain/provider/flutter_quiz_provider.dart';
import 'package:rnly/app/shared/shared.dart';

import '../../domain/provider/quiz_current_question_index_provider.dart';

class QuizTextCountComponent extends StatefulWidget {
  const QuizTextCountComponent({super.key});

  @override
  State<QuizTextCountComponent> createState() => _QuizTextCountComponentState();
}

class _QuizTextCountComponentState extends State<QuizTextCountComponent> {
  @override
  Widget build(BuildContext context) {
    final questionsNotifer = context.watch<FluttterQuizNotiferProvider>();

    final questionIndex = context.watch<QuizCurrentQuestionIndexProvider>();

    return questionsNotifer.state.when(
      done: (data) {
        return Container(
          margin: const EdgeInsets.all(Spacings.spacing10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Spacings.spacing10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: data.asMap().entries.map((entry) {
              int index = entry.key;
              return Container(
                padding: const EdgeInsets.all(Spacings.spacing20),
                margin: const EdgeInsets.only(left: Spacings.spacing10),
                decoration: BoxDecoration(
                  color: index == questionIndex.state.data!
                      ? red.withOpacity(0.2)
                      : baseColor,
                  borderRadius: BorderRadius.circular(Spacings.spacing8),
                ),
                child: Text(
                  (index + 1).toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
      error: (_) => Text(_.toString()),
      loading: () => const CircularProgressIndicator.adaptive(),
    );
  }
}
