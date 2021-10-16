import 'package:aslrabbids/models/Alphabet.dart';
import 'package:flutter/material.dart';

class AlphabetCard extends StatelessWidget {
  const AlphabetCard({Key? key, required this.alphabet}) : super(key: key);
  final Flashcard alphabet;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 300,
      child: Stack(
        children: [
          // SizedBox(
          //   height: 350,
          //   width: MediaQuery.of(context).size.width,
          //   child: const DecoratedBox(
          //     decoration: const BoxDecoration(color: Colors.white),
          //   ),
          // ),
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(alphabet.photopath),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
