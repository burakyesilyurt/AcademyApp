import "package:flutter/material.dart";
import '../../nav_bar.dart';

class QuizzMark extends StatelessWidget {
  QuizzMark({super.key, required this.correctAnswers});
  int correctAnswers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quizz Sonuçları"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Toplam Doğru Sayısı",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
              child: Text(
            correctAnswers.toString(),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const NavBar()),
            (Route<dynamic> route) => false,
          );
        },
        child: const Icon(
          Icons.home,
        ),
      ),
    );
  }
}
