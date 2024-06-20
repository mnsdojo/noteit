import 'package:flutter/material.dart';
import 'package:noteit/src/models/note.dart';
import 'package:noteit/src/service/note_service.dart';
import 'package:noteit/src/styles/theme.dart';
import 'package:noteit/src/views/widgets/category_list.dart';
import 'package:noteit/src/views/widgets/custom_app_bar.dart';
import 'package:noteit/src/views/widgets/hero_text.dart';

class Home extends StatelessWidget {
  const Home({super.key}); // Corrected constructor syntax

  @override
  Widget build(BuildContext context) {
    final NoteService noteService = NoteService(NoteDatabase());

    return Scaffold(
      backgroundColor: AppTheme.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppbar(
                title: "title",
                leading: CircleAvatar(),
                actions: [IconButton(onPressed: null, icon: Icon(Icons.add))],
              ),
              const SizedBox(height: 10),
              const Center(child: HeroText()),
              const SizedBox(height: 10),
              const CategoryList(),
              const SizedBox(height: 10),
              Expanded(
                child: StreamBuilder<List<NoteItem>>(
                  stream: noteService.watchNotes(),
                  builder: (context, AsyncSnapshot<List<NoteItem>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No notes available'),
                      );
                    } else {
                      final notes = snapshot.data!;

                      return ListView.builder(
                        itemCount: notes.length,
                        itemBuilder: (context, index) {
                          final note = notes[index];
                          return ListTile(
                            title: Text(note.title),
                            subtitle: Text(note
                                .description), // Assuming NoteItem has a 'content' property
                            leading: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () async {
                                NoteItem updated = NoteItem(
                                    id: note.id,
                                    title: "bruhhhhhhhhhhhhhhhhhhhhhh",
                                    description:
                                        "lollllllllllllllllllllllllllllllllesfdfll");
                                noteService.updateNote(updated);
                                // noteService.deleteNoteById(note.id);
                              },
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
