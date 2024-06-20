import 'package:flutter/material.dart';

class HeroText extends StatelessWidget {
  const HeroText({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 120, // Adjust height as needed
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "your",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8), // Adjust vertical spacing as needed
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "notes",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                  width:
                      10), // Adjust horizontal spacing between "notes" and "/14"
              Text(
                "/14",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
