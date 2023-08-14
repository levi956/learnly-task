import 'package:rnly/app/modules/quiz/data/quiz_question_model.dart';
import 'package:rnly/app/modules/quiz/domain/repository/quiz_repository.dart';
import 'package:rnly/core/framework/base_notifier.dart';

class FluttterQuizNotiferProvider
    extends BaseNotifier<List<QuizQuestionModel>> {
  final QuizRepository _repo;

  FluttterQuizNotiferProvider(this._repo);
  @override
  void onInit() {
    _loadQuestions();
    super.onInit();
  }

  Future<void> _loadQuestions() async {
    setLoading();
    state = await _repo.getFlutterQuiz();
    notifyListeners();
  }
}
