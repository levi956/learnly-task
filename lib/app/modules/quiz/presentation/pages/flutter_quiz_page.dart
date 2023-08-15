import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rnly/app/shared/shared.dart';

import '../../domain/provider/flutter_quiz_provider.dart';
import '../components/quiz_question_options_component.dart';
import '../components/quiz_questions_component.dart';
import '../components/quiz_text_count_component.dart';

class FlutterQuizPage extends StatefulWidget {
  const FlutterQuizPage({super.key});

  @override
  State<FlutterQuizPage> createState() => _FlutterQuizPageState();
}

class _FlutterQuizPageState extends State<FlutterQuizPage> {
  @override
  Widget build(BuildContext context) {
    final questionsNotifer = context.watch<FluttterQuizNotiferProvider>();

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
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Text(
                        "Flutter Knowledge Quiz",
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
