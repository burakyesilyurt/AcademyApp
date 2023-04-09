import 'package:academy_app/database/quiz_list.dart';
import "package:flutter/material.dart";
import 'add_quiz/quiz_add_screen.dart';
import 'add_quiz/quiz_num.dart';
import "../database/quiz_all.dart";
import './open_quizz/open_quizz_screen.dart';
import "../nav_bar.dart";

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Quizler")),
      ),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(
          children: [
            //QuizCard(baslik: "Ornek Başlık", soruSayisi: "5"),
            for (var quiz in QuizAll.allQuizzes)
              QuizCard(
                  baslik: quiz.konusu,
                  soruSayisi: quiz.quizzes.length.toString(),
                  quiz: quiz),
          ],
        ),
      )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 146, 196, 238),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const QuizNum()));
          },
          child: const Icon(Icons.add_box),
        ),
      ),
    );
  }
}

class QuizCard extends StatelessWidget {
  const QuizCard(
      {super.key,
      required this.baslik,
      required this.soruSayisi,
      required this.quiz});
  final QuizList quiz;
  final String baslik;
  final String soruSayisi;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //print(quiz.quizzes[0].soru);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OpenQuizzScreen(
                    quiz: quiz,
                  )),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Card(
          color: Color.fromARGB(255, 146, 196, 238),
          elevation: 4,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        baslik,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                        padding: const EdgeInsets.only(right: 20),
                        onPressed: () {
                          QuizAll quizId = QuizAll();
                          quizId.remove(quiz.id);
                          Navigator.pop(context);
                          Navigator.pushNamed(context, "/nav");
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 250, 67, 67),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Soru Sayisi: " + soruSayisi,
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
