import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rnly/app/modules/quiz/domain/provider/quiz_current_question_index_provider.dart';
import 'package:rnly/app/modules/scores/presentation/domain/provider/quiz_score_notifier_provider.dart';
import 'package:rnly/app/shared/functions/int_functions.dart';
import 'package:rnly/app/shared/shared.dart';
import 'package:rnly/core/core.dart';

class QuizScorePage extends StatelessWidget {
  const QuizScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final quizScoreProvider = context.watch<QuizScoreNotiferProvider>();

    return Scaffold(
      backgroundColor: black,
      body: Stack(
        children: [
          const Opacity(
            opacity: 0.4,
            child: BG(),
          ),
          SafeArea(
            child: Column(
              children: [
                const Logo(
                  size: 50,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "You scored!",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                quizScoreProvider.state.when(
                                  done: (score) {
                                    return Text(
                                      fractionToPercentage(score).toString(),
                                      style: const TextStyle(
                                        fontSize: 75,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  },
                                  error: (_) => Text(_.toString()),
                                  loading: () => const SizedBox.shrink(),
                                  idle: () => Text(0.toString()),
                                ),
                                const Text(
                                  "%",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      DashboardItem(
                        icon: Icons.exit_to_app_rounded,
                        subText: "",
                        mainText: "Back to Home",
                        onTap: () {
                          pushToAndClearStack(context, const DashboardPage());
                          context.read<QuizScoreNotiferProvider>().resetScore();
                          context
                              .read<QuizCurrentQuestionIndexProvider>()
                              .clear();
                        },
                        color: red.withOpacity(0.2),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
