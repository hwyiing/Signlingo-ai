import 'package:flutter/material.dart';

class FlashcardPhotoView extends StatelessWidget {
  final String photopath;

  FlashcardPhotoView({Key? key, required this.photopath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        child: Center(
          child: Container(
            height: 280,
            width: 280,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(photopath),
              ),
            ),
          ),
        ));
  }
}
