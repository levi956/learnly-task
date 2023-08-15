import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rnly/app/modules/quiz/domain/provider/html_quiz_provider.dart';
import 'package:rnly/app/shared/shared.dart';

import '../components/quiz_question_options_component.dart';
import '../components/quiz_questions_component.dart';
import '../components/quiz_text_count_component.dart';

class HtmlQuizPage extends StatefulWidget {
  const HtmlQuizPage({super.key});

  @override
  State<HtmlQuizPage> createState() => _HtmlQuizPageState();
}

class _HtmlQuizPageState extends State<HtmlQuizPage> {
  @override
  Widget build(BuildContext context) {
    final questionsNotifer = context.watch<HtmlQuizNotiferProvider>();

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: Spacings.spacing30),
                const Padding(
                  padding: EdgeInsets.only(left: Spacings.spacing20),
                  child: Column(
                    children: [
                      Text(
                        "HTML Knowledge Quiz",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(height: Spacings.spacing30),
                      const QuizTextCountComponent(),
                      const SizedBox(height: Spacings.spacing30),
                      questionsNotifer.state.when(
                        done: (questions) {
                          return Column(
                            children: [
                              QuizQuestionsComponent(questions),
                              QuestionOptionsComponent(questions),
                            ],
                          );
                        },
                        error: (_) => Text(_.toString()),
                        loading: () =>
                            const CircularProgressIndicator.adaptive(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
