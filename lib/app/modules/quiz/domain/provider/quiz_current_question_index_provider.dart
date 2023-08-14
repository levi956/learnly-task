import 'package:rnly/core/framework/base_notifier.dart';

class QuizCurrentQuestionIndexProvider extends BaseNotifier<int> {
  QuizCurrentQuestionIndexProvider() {
    state = const NotifierState<int>(status: NotifierStatus.idle, data: 0);
  }

  void nextQuestion() {
    int count = state.data!;
    count++;
    setData(count);
  }

  void clear() {
    setData(0);
  }
}
