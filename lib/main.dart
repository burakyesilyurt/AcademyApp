import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './nav_bar.dart';
import './notes/notes_screen.dart';
import './notes/add_note/add_note_screen.dart';
import './notes/open_note/open_note_screen.dart';
import './quizzes/quizzes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
      )),
      home: const NavBar(),
      routes: <String, WidgetBuilder>{
        '/nav': (BuildContext context) => const NavBar(),
        '/notesPage': (BuildContext context) => const NoteScreen(),
        '/noteAddPage': (BuildContext context) => const AddNoteScreen(),
        '/quizPage': (BuildContext context) => const QuizScreen(),
      },
    );
  }
}
