import "package:flutter/material.dart";
import "./quiz_add_screen.dart";

class QuizNum extends StatefulWidget {
  const QuizNum({super.key});

  @override
  State<QuizNum> createState() => _QuizNumState();
}

class _QuizNumState extends State<QuizNum> {
  final TextEditingController soruSayisi = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Soru Sayisi Belirleme")),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Soru Sayisi", style: TextStyle(fontSize: 20)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: TextField(
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.bottom,
            controller: soruSayisi,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: "",
                contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 10)),
          ),
        ),
      ])),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 146, 196, 238),
          onPressed: () {
            int soruSayisiInt = int.parse(soruSayisi.text);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => QuizAddScreen(
                      soruSayisi: soruSayisiInt,
                    )));
          },
          child: const Icon(Icons.add_box),
        ),
      ),
    );
  }
}
