import 'package:flutter/material.dart';

class ArrowHintWidget extends StatelessWidget {
  final double screenHeight;
  final bool left;
  final bool right;

  ArrowHintWidget({this.screenHeight, this.left = false, this.right = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        if (left)
          Positioned(
            left: 0,
            top: screenHeight / 2,
            child: Icon(
              Icons.navigate_before,
              color: Colors.white.withOpacity(0.7),
              size: 30,
            ),
          ),
        if (right)
          Positioned(
            right: 0,
            top: screenHeight / 2,
            child: Icon(
              Icons.navigate_next,
              color: Colors.white.withOpacity(0.7),
              size: 30,
            ),
          )
      ],
    );
  }
}
