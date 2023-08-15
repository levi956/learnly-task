import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rnly/app/modules/quiz/presentation/atoms/quiz_option_card.dart';
import 'package:rnly/core/core.dart';

import '../../data/models/quiz_question_model.dart';
import '../../domain/provider/quiz_current_question_index_provider.dart';
import '../../../scores/presentation/domain/provider/quiz_score_notifier_provider.dart';
import '../../../scores/presentation/pages/quiz_score_page.dart';

class QuestionOptionsComponent extends StatelessWidget {
  const QuestionOptionsComponent(this.questions, {super.key});

  final List<QuizQuestionModel> questions;

  @override
  Widget build(BuildContext context) {
    final questionIndex = context.watch<QuizCurrentQuestionIndexProvider>();

    return Wrap(
      children: questions[questionIndex.state.data!].options.map((option) {
        final options = questions[questionIndex.state.data!].options;
        final rightAnswer =
            questions[questionIndex.state.data!].correctAnswerIndex;
        return GestureDetector(
          onTap: () {
            if (options.indexOf(option) == rightAnswer) {
              context.read<QuizScoreNotiferProvider>().markCorrect();
            }

            if (questionIndex.state.data! < questions.length - 1) {
              context.read<QuizCurrentQuestionIndexProvider>().nextQuestion();
            } else {
              const page = QuizScorePage();
              pushTo(context, page);
            }
          },
          child: QuizOptionCard(
            mainText: option,
          ),
        );
      }).toList(),
    );
  }
}
