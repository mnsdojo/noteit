import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noteit/src/models/note.dart';

final notesServiceProvider = Provider<NoteDatabase>((ref) {
  final db = NoteDatabase();
  ref.onDispose(db.close);
  return db;
});
