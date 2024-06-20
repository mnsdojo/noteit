import "dart:io";

import "package:drift/drift.dart";
import "package:drift/native.dart";
import "package:path/path.dart";
// ignore: depend_on_referenced_packages
import 'package:sqlite3/sqlite3.dart';
import "package:path_provider/path_provider.dart";
import "package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart";

part "note.g.dart";

class NoteItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get description => text().named('body')();
  DateTimeColumn get createdAt => dateTime().nullable()();
}

@DriftDatabase(tables: [NoteItems])
class NoteDatabase extends _$NoteDatabase {
  NoteDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  Stream<List<NoteItem>> watchNotes() => select(noteItems).watch();

  Future<void> addNote(String title, String description) async {
    await into(noteItems).insert(
        NoteItemsCompanion.insert(title: title, description: description));
  }

  Future<void> deleteNoteById(int id) async {
    await (delete(noteItems)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> updateNote(NoteItem note) async {
    final existinnote = await (select(noteItems)
          ..where((tbl) => tbl.id.equals(note.id)))
        .getSingleOrNull();
    if (existinnote != null) {
      await update(noteItems).replace(note);
    } else {
      throw Exception("Note with id : ${note.id} not found");
    }
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
