import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: List.generate(8, (index) {
          return Padding(
              padding: const EdgeInsets.only(
                  right: 8), // Adjust spacing between badges
              child: Badge(
                text: "#prersonal",
                onPressed: () {},
              ));
        })));
  }
}

class Badge extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback? onPressed;
  const Badge({
    super.key,
    this.selected = false,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (selected) {
      return OutlinedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ));
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      );
    }
  }
}
