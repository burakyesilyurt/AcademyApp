import './quiz_list.dart';

class QuizAll {
  static List<QuizList> allQuizzes = [];

  void add(QuizList quiz) {
    allQuizzes.add(quiz);
  }

  void remove(int id) {
    allQuizzes.removeWhere((item) => item.id == id);
  }
}
