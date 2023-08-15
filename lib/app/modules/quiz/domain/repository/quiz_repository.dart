import 'package:rnly/app/modules/quiz/data/models/quiz_question_model.dart';
import 'package:rnly/app/modules/quiz/domain/services/quiz_service.dart';
import 'package:rnly/core/framework/base_notifier.dart';
import 'package:rnly/core/framework/convert_functions.dart';

class QuizRepository {
  FutureNotifierState<List<QuizQuestionModel>> getFlutterQuiz() {
    return convert(QuizService.getFlutterQuestions);
  }

  FutureNotifierState<List<QuizQuestionModel>> getHtmlQuiz() {
    return convert(QuizService.getHtmlQuiz);
  }
}
