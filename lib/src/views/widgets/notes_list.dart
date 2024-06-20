import 'package:flutter/material.dart';
import 'package:noteit/src/styles/theme.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: const Text(
                      "lol",
                    ),
                    subtitle: const Text("Description"),
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
                itemCount: 10);
          }
        ));
  }
}
