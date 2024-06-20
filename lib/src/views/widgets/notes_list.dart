import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noteit/src/models/note.dart';
import 'package:noteit/src/provider/notes_provider.dart';
import 'package:noteit/src/styles/theme.dart';

class NotesList extends ConsumerWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteService = ref.read(notesServiceProvider);
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: StreamBuilder<List<NoteItem>>(
            stream: noteService.watchNotes(),
            builder: (context, AsyncSnapshot<List<NoteItem>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Text("Loading"),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              }
              final notes = snapshot.data!;
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final note = notes[index];
                    return ListTile(
                      title: Text(note.title),
                      trailing: const Text("01/"),
                      subtitle: Text(note.description),
                      onTap: () {},
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 8,
                      color: AppTheme.white,
                      thickness: 0.5,
                      indent: 16,
                      endIndent: 16,
                    );
                  },
                  itemCount: notes.length);
            }));
  }
}
