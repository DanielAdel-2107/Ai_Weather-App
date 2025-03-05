import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  var path = Path();
  @override
  getClip(Size size) {
    path.lineTo(0, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
