import 'package:flutter/material.dart';

class StartBackground extends StatelessWidget {
  const StartBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/images/startbackground.png",
            ),
            fit: BoxFit.fill),
      ),
    );
  }
}
