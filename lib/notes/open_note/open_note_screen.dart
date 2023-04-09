import "package:academy_app/database/note_list.dart";
import "package:flutter/material.dart";
import '../../database/notes.dart';

class OpenNoteScreen extends StatelessWidget {
  OpenNoteScreen(
      {super.key,
      required this.title,
      required this.content,
      required this.id});
  final String title;
  final String content;
  final int id;

  final TextEditingController baslik = TextEditingController();
  final TextEditingController note = TextEditingController();

  @override
  Widget build(BuildContext context) {
    baslik.text = title;
    note.text = content;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            controller: baslik,
            decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                hintText: title,
                hintStyle: const TextStyle(color: Colors.white)),
            onTap: () {
              baslik.text = title;
            },
          ),
          TextField(
            controller: note,
            maxLines: 10,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: content,
                hintStyle: const TextStyle(color: Colors.white)),
            onTap: () {
              note.text = content;
            },
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Database database = Database();
          Notes? newNote = database.update(id);
          newNote?.baslik = baslik.text;
          newNote?.note = note.text;
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pushNamed(context, "/nav");
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
