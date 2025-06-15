import 'package:flutter/material.dart';

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double centerX = size.width / 2;
    double radius = 38;

    Path path = Path()
      ..lineTo(centerX - radius - 20, 0)
      ..quadraticBezierTo(centerX, 80, centerX + radius + 20, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
