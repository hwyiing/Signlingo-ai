import 'package:aslrabbids/widgets/background.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'models/Alphabet.dart';
import 'widgets/flashcard_backview.dart';
import 'widgets/flashcard_frontview.dart';

int _currIndex = 0;

class RabbidFlashcards extends StatefulWidget {
  const RabbidFlashcards({Key? key}) : super(key: key);

  @override
  _RabbidFlashcardsState createState() => _RabbidFlashcardsState();
}

class _RabbidFlashcardsState extends State<RabbidFlashcards> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Stack(
          children: [
            BackgroundContainer(),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 350,
                        height: 450,
                        child: FlipCard(
                            front: FlashcardLetterView(
                                text: Flashcard.alphabets[_currIndex].letter),
                            back: FlashcardPhotoView(
                                photopath: Flashcard
                                    .alphabets[_currIndex].photopath))),
                    SizedBox(height: 40),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OutlinedButton.icon(
                              onPressed: previousCard,
                              icon: Icon(
                                Icons.chevron_left,
                                color: Colors.black87,
                              ),
                              label: Text(
                                'Prev',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )),
                          OutlinedButton.icon(
                              onPressed: nextCard,
                              icon: Icon(Icons.chevron_right,
                                  color: Colors.black87),
                              label: Text(
                                'Next',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )),
                        ])
                  ]),
            ),
          ],
        )));
  }

  void nextCard() {
    setState(() {
      _currIndex =
          (_currIndex + 1 < Flashcard.alphabets.length) ? _currIndex + 1 : 0;
    });
  }

  void previousCard() {
    setState(() {
      _currIndex = (_currIndex - 1 >= 0)
          ? _currIndex - 1
          : Flashcard.alphabets.length - 1;
    });
  }
}
