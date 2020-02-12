import 'package:flutter/material.dart';

class TitleCoverWidget extends StatelessWidget {

  final double screenWidth;
  final double screenHeight;
  final String imagePath;
  final Widget title;
  final Function onTap;
  final int idx;

  TitleCoverWidget({this.screenWidth, this.screenHeight, this.imagePath, this.title, this.idx, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            width: screenWidth,
            height: screenHeight,
            child: Hero(
              tag: idx,
              child: Image.network(
                imagePath,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              bottom: 100.0,
            ),
            child: title,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 16.0,
              bottom: 20.0,
            ),
            width: 3,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
