import 'package:rnly/core/framework/base_notifier.dart';

class QuizScoreNotiferProvider extends BaseNotifier<int> {
  QuizScoreNotiferProvider() {
    state = const NotifierState<int>(status: NotifierStatus.idle, data: 0);
  }

  void markCorrect() {
    int count = state.data!;
    count++;
    setData(count);
  }

  void resetScore() {
    setData(0);
  }
}
