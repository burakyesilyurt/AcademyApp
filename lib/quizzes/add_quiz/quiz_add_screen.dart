import "package:flutter/material.dart";
import '../../database/quiz_list.dart';
import '../../database/quiz.dart';
import '../../nav_bar.dart';
import "../../database/quiz_all.dart";

class QuizAddScreen extends StatefulWidget {
  QuizAddScreen({super.key, required this.soruSayisi});
  final int soruSayisi;

  @override
  State<QuizAddScreen> createState() => _QuizAddScreenState();
}

class _QuizAddScreenState extends State<QuizAddScreen> {
  QuizList quizList = QuizList();
  final TextEditingController soru = TextEditingController();
  final TextEditingController dogruCevap = TextEditingController();
  final TextEditingController yanlisCevap1 = TextEditingController();
  final TextEditingController yanlisCevap2 = TextEditingController();
  final TextEditingController konu = TextEditingController();

  int textFieldNum = 1;
  int numberOfQuestionLeft = 1;
  @override
  Widget build(BuildContext context) {
    String textFieldSoru = "Soru $textFieldNum";
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          if (textFieldNum == 1) ...[
            TextField(
              controller: konu,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Quiz Konusu",
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 10)),
            )
          ],
          TextField(
            controller: soru,
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: textFieldSoru,
                contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 10)),
          ),
          TextField(
            controller: dogruCevap,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: "Doğru Cevap",
                contentPadding: EdgeInsets.fromLTRB(10, 30, 0, 10)),
          ),
          TextField(
            controller: yanlisCevap1,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: "Yanlış Cevap",
                contentPadding: EdgeInsets.fromLTRB(10, 30, 0, 10)),
          ),
          TextField(
            controller: yanlisCevap2,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Yanlış Cevap 2",
                contentPadding: EdgeInsets.fromLTRB(10, 30, 0, 0)),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Quiz addQuiz = Quiz(
              soru.text, dogruCevap.text, yanlisCevap1.text, yanlisCevap2.text);
          quizList.add(addQuiz);
          if (textFieldNum == 1) {
            quizList.addKonu(konu.text);
          }

          setState(() {
            soru.text = "";
            dogruCevap.text = "";
            yanlisCevap1.text = "";
            yanlisCevap2.text = "";
            textFieldNum++;
          });

          if (numberOfQuestionLeft == widget.soruSayisi) {
            QuizAll quizAll = QuizAll();
            quizAll.add(quizList);
            // print(QuizAll.allQuizzes[0].quizzes[0].soru);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const NavBar()),
              (Route<dynamic> route) => false,
            );
          } else {
            numberOfQuestionLeft++;
            QuizAddScreen(soruSayisi: numberOfQuestionLeft);
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
