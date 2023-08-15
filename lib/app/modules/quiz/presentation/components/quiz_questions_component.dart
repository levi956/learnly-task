import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/quiz_question_model.dart';
import '../../domain/provider/quiz_current_question_index_provider.dart';

class QuizQuestionsComponent extends StatelessWidget {
  const QuizQuestionsComponent(
    this.questions, {
    super.key,
  });

  final List<QuizQuestionModel> questions;

  @override
  Widget build(BuildContext context) {
    final questionIndex = context.watch<QuizCurrentQuestionIndexProvider>();

    return Text(
      questions[questionIndex.state.data!].question,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    );
  }
}
