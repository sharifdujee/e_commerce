import 'package:flutter/material.dart';

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double centerX = size.width / 2;
    double fabRadius = 35;

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(centerX - fabRadius - 10, 0)
      ..quadraticBezierTo(
          centerX, -fabRadius * 1.2, centerX + fabRadius + 10, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}