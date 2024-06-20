import 'package:flutter/material.dart';
import 'package:noteit/src/styles/theme.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final Widget leading;
  final List<Widget> actions;

  const CustomAppbar({
    super.key,
    required this.title,
    required this.leading,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leading, // Leading widget (e.g., avatar or icon)
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: actions,
              ),
            ],
          ),
          const SizedBox(height: 8), // Adjust spacing between title and content
          const Divider(
            height: 20,
            color: AppTheme.white,
          ),
        ],
      ),
    );
  }
}
