import 'package:aslrabbids/widgets/startbackground.dart';
import 'package:flutter/material.dart';

class RabbidStart extends StatelessWidget {
  const RabbidStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StartBackground(),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  child: Text('Get started',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueGrey,
                      )),
                  onPressed: () {
                    //pushing another screen on top of the current screen
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
