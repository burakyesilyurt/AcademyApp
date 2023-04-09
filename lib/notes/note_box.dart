import "package:academy_app/notes/open_note/open_note_screen.dart";
import "package:flutter/material.dart";
import '../notes/open_note/open_note_screen.dart';
import '../database/note_list.dart';

class NoteBox extends StatelessWidget {
  const NoteBox(
      {super.key,
      required this.noteTitle,
      required this.noteText,
      required this.id});

  final String noteTitle;
  final String noteText;
  final int id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  OpenNoteScreen(title: noteTitle, content: noteText, id: id)),
        );
      },
      child: Container(
        width: 100,
        child: Card(
          color: Colors.yellow[100],
          elevation: 4,
          shadowColor: Colors.amberAccent[600],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 5, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        noteTitle.length > 7
                            ? noteTitle.substring(0, 7) + "..."
                            : noteTitle,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                      ),
                      Container(
                          child: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 250, 67, 67),
                        ),
                        onPressed: () {
                          Database database = Database();
                          database.remove(id);
                          Navigator.pop(context);
                          Navigator.pushNamed(context, "/nav");
                        },
                      ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    noteText.length > 120
                        ? noteText.substring(0, 120) + "..."
                        : noteText,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
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
