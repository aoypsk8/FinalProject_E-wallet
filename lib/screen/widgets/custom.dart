import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    var curXPos = 0.0;
    var curYPos = size.height;
    var increment = size.width / 38;
    while (curXPos < size.width) {
      curXPos += increment;
      curYPos = curYPos == size.height ? size.height - 20 : size.height;
      path.lineTo(curXPos, curYPos);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(size.height, size.width);

    path.close();
    return path;

    // double gap = 25.0;
    // var path = Path();
    // path.moveTo(gap, 0); //top left
    // path.lineTo(0, size.width - gap); //top right
    // path.lineTo(size.width, size.height); // bottom right
    // path.lineTo(0, size.height); //bottom left
    // path.lineTo(gap, 0); //connect the top left
    // return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
