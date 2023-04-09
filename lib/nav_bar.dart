import "package:flutter/material.dart";
import "./notes/notes_screen.dart";
import "./quizzes/quizzes_screen.dart";
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, this.navSelect = 0});
  final int navSelect;
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _index = 0;
  final screens = [
    NoteScreen(),
    QuizScreen(),
  ];
  int colorChange = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: colorChange == 0
            ? Color.fromARGB(255, 190, 223, 250)
            : Colors.yellow.shade100,
        items: <Widget>[
          Icon(
            Icons.edit_note,
            size: 42,
            color: Colors.red.shade600,
          ),
          Icon(
            Icons.question_mark,
            size: 42,
            color: Colors.blue.shade700,
          ),
        ],
        onTap: (index) {
          setState(() {
            if (index == 0) {
              colorChange = 1;
            } else {
              colorChange = 0;
            }
            _index = index;
          });
        },
      ),
    );
  }
}
