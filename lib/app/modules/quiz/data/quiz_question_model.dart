class QuizQuestionModel {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  QuizQuestionModel({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}
