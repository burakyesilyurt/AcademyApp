import 'package:academy_app/database/notes.dart';

class Database {
  static List<Notes> notes = [];

  void add(Notes note) {
    notes.add(note);
  }

  void remove(int id) {
    notes.removeWhere((item) => item.id == id);
  }

  Notes? update(int id) {
    return notes.firstWhere((element) => element.id == id);
  }
}
