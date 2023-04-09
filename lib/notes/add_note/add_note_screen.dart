import "package:flutter/material.dart";
import '../../database/notes.dart';
import '../../database/note_list.dart';
import '../notes_screen.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController baslik = TextEditingController();
  final TextEditingController note = TextEditingController();

  Database database = Database();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    baslik.dispose();
    note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            controller: baslik,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(), hintText: "Başlık"),
          ),
          TextField(
            controller: note,
            maxLines: 10,
            decoration: const InputDecoration(
                border: InputBorder.none, hintText: "İçerik"),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          Notes addNote = Notes(baslik.text, note.text);
          database.add(addNote);
          Navigator.pop(context);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
