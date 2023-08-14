import 'package:provider/provider.dart';
import 'package:rnly/app/modules/quiz/domain/provider/flutter_quiz_provider.dart';
import 'package:rnly/app/modules/quiz/domain/provider/html_quiz_provider.dart';
import 'package:rnly/app/modules/quiz/domain/repository/quiz_repository.dart';

import '../../app/modules/quiz/domain/provider/quiz_current_question_index_provider.dart';
import '../../app/modules/scores/presentation/domain/provider/quiz_score_notifier_provider.dart';

final appProviders = [
  ChangeNotifierProvider<FluttterQuizNotiferProvider>(
    create: (context) => FluttterQuizNotiferProvider(QuizRepository()),
  ),
  ChangeNotifierProvider<HtmlQuizNotiferProvider>(
    create: (context) => HtmlQuizNotiferProvider(QuizRepository()),
  ),
  ChangeNotifierProvider<QuizScoreNotiferProvider>(
    create: (context) => QuizScoreNotiferProvider(),
  ),
  ChangeNotifierProvider<QuizCurrentQuestionIndexProvider>(
    create: (context) => QuizCurrentQuestionIndexProvider(),
  ),
];
