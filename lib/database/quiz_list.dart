import './quiz.dart';

class QuizList {
  int soruSayisi = 0;
  int id = 0;
  late String konusu;
  static int count = 0;
  List<Quiz> quizzes = [];
  //static List<List<Quiz>> lines = [];

  QuizList() {
    count++;
    id = count;
  }
  void addKonu(String konu) {
    konusu = konu;
  }

  void add(Quiz quiz) {
    quizzes.add(quiz);
  }

  void remove(int id) {
    quizzes.removeWhere((item) => item.id == id);
  }
}
