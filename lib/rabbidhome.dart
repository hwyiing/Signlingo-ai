import 'package:aslrabbids/widgets/background.dart';
import 'package:flutter/material.dart';

class RabbidHome extends StatefulWidget {
  const RabbidHome({Key? key}) : super(key: key);

  @override
  _RabbidHomeState createState() => _RabbidHomeState();
}

class _RabbidHomeState extends State<RabbidHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        BackgroundContainer(),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 155.0, bottom: 10, left: 25, right: 25),
              child: FittedBox(
                child: Row(
                  children: [
                    SizedBox(
                      width: 270,
                      child: Text(
                        'Welcome to Signlingo.ai',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 50),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Text(
                  'Building connections, one sign at a time',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 70),
            Icon(Icons.local_library_outlined, size: 80, color: Colors.white),
            SizedBox(height: 20), //divider between the elements
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  child: Text(' Build up on ASL knowledge',
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey)),
                  onPressed: () {
                    //pushing another screen on top of the current screen
                    Navigator.pushNamed(context, '/learn');
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  child: Text('Test your Skills',
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey)),
                  onPressed: () {
                    //pushing another screen on top of the current screen
                    Navigator.pushNamed(context, '/camera');
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
