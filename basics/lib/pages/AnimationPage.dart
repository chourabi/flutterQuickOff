import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  AnimationPage({Key key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  double h = 100;
  double w = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  h = 250;
                  w = 250;
                });
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                height: h,
                width: w,
                color: Colors.amberAccent,
                curve: Curves.elasticIn,
              ),
            )
          ],
        ),
      ),
    );
  }
}
