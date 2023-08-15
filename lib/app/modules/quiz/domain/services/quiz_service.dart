import 'package:rnly/app/modules/quiz/data/quiz_data.dart';
import 'package:rnly/app/modules/quiz/data/models/quiz_question_model.dart';
import 'package:rnly/core/framework/service_response.dart';

class QuizService {
  static FutureHandler<List<QuizQuestionModel>> getFlutterQuestions() {
    return serveFuture<List<QuizQuestionModel>>(
      function: (fail) async {
        await Future.delayed(const Duration(seconds: 1));
        return flutterQuestions;
      },
    );
  }

  static FutureHandler<List<QuizQuestionModel>> getHtmlQuiz() {
    return serveFuture<List<QuizQuestionModel>>(
      function: (fail) async {
        await Future.delayed(const Duration(seconds: 1));
        return htmlQuestions;
      },
    );
  }
}
