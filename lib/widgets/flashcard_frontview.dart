import 'package:flutter/material.dart';

class FlashcardLetterView extends StatelessWidget {
  final String text;

  FlashcardLetterView({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Center(
        child: Text(
          flashcardText(text),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  String flashcardText(String text) {
    if (text == "1" || text == "2") {
      return ("Fun Fact!");
    } else {
      return ("What is the sign for ${text}?");
    }
  }
}
