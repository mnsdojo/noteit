import 'package:noteit/src/models/note.dart';

class NoteService {
  final NoteDatabase _db;

  NoteService(this._db);
  Stream<List<NoteItem>> watchNotes() {
    return _db.select(_db.noteItems).watch();
  }

  Future<void> addNote(String title, String description) async {
    await _db.into(_db.noteItems).insert(
        NoteItemsCompanion.insert(title: title, description: description));
  }

  Future<void> deleteNoteById(int id) async {
    await (_db.delete(_db.noteItems)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> updateNote(NoteItem note) async {
    final existinnote = await (_db.select(_db.noteItems)
          ..where((tbl) => tbl.id.equals(note.id)))
        .getSingleOrNull();
    if (existinnote != null) {
      await _db.update(_db.noteItems).replace(note);
    } else {
      throw Exception("Note with id : ${note.id} not found");
    }
  }
}
