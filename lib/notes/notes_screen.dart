import "package:flutter/material.dart";
import './note_box.dart';
import '../database/note_list.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({
    super.key,
  });

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Notlar")),
      ),
      body: NotesScreenBody(),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: FloatingActionButton(
          backgroundColor: Colors.yellow[100],
          onPressed: () {
            Navigator.of(context)
                .pushNamed("/noteAddPage")
                .then((value) => setState(() {}));
          },
          child: const Icon(Icons.add_box),
        ),
      ),
    );
  }
}

class NotesScreenBody extends StatelessWidget {
  const NotesScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      padding: const EdgeInsets.all(8),
      children: [
        const NoteBox(
            id: 0,
            noteTitle: "Başlık",
            noteText:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus quis ligula est.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet"),
        for (var note in Database.notes)
          NoteBox(
            noteTitle: note.baslik,
            noteText: note.note,
            id: note.id,
          )
      ],
    );
  }
}
