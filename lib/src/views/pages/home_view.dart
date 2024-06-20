import 'package:flutter/material.dart';

import 'package:noteit/src/styles/theme.dart';
import 'package:noteit/src/views/widgets/category_list.dart';
import 'package:noteit/src/views/widgets/custom_app_bar.dart';
import 'package:noteit/src/views/widgets/hero_text.dart';
import 'package:noteit/src/views/widgets/notes_list.dart';

class Home extends StatelessWidget {
  const Home({super.key}); // Corrected constructor syntax

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppTheme.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppbar(
                title: "title",
                leading: CircleAvatar(),
                actions: [IconButton(onPressed: null, icon: Icon(Icons.add))],
              ),
              SizedBox(height: 10),
              Center(child: HeroText()),
              SizedBox(height: 10),
              CategoryList(),
              SizedBox(height: 10),
              Expanded(
                child: NotesList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
