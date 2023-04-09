import "package:flutter/material.dart";
import '../../database/quiz_list.dart';
import './quizz_marks.dart';
import "package:fluttertoast/fluttertoast.dart";

class OpenQuizzScreen extends StatefulWidget {
  const OpenQuizzScreen({super.key, required this.quiz});
  final QuizList quiz;

  @override
  State<OpenQuizzScreen> createState() => _OpenQuizzScreenState();
}

class _OpenQuizzScreenState extends State<OpenQuizzScreen> {
  int questionNum = 0;
  int correctAnswers = 0;

  @override
  Widget build(BuildContext context) {
    String dogruCevap = widget.quiz.quizzes[questionNum].dogruCevap;
    String yanlisCevap1 = widget.quiz.quizzes[questionNum].yanlisCevap1;
    String yanlisCevap2 = widget.quiz.quizzes[questionNum].yanlisCevap2;
    List cevaplar = [
      {"soru": dogruCevap, "cevap": 0},
      {"soru": yanlisCevap1, "cevap": 1},
      {"soru": yanlisCevap2, "cevap": 1}
    ];
    cevaplar.shuffle();

    return Scaffold(
      appBar: AppBar(title: Text("Soru ${questionNum + 1}")),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            widget.quiz.quizzes[questionNum].soru,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var answer in cevaplar)
                InkWell(
                  onTap: () {
                    if (answer["cevap"] == 0) {
                      correctAnswers++;
                      toastWidget(true);
                    } else {
                      toastWidget(false);
                    }
                    if (questionNum == widget.quiz.quizzes.length - 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizzMark(
                                  correctAnswers: correctAnswers,
                                )),
                      );
                    }
                    if (questionNum != widget.quiz.quizzes.length - 1) {
                      setState(() {
                        questionNum++;
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 51, 123, 230),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    width: 130,
                    height: 80,
                    child: Text(answer["soru"]),
                    alignment: Alignment.center,
                  ),
                ),
            ],
          ),
        ]),
      ),
    );
  }

  void toastWidget(bool check) {
    Fluttertoast.showToast(
        msg: check ? "Doğru Cevap" : "Yanlış Cevap",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: check ? Colors.green : Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
