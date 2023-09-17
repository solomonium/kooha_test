import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  final double width;
  final double? height;
  final Color color;

  const Line(
      {Key? key,
      required this.width,
      this.height = 1.0,
      this.color = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Container(height: height, width: width, color: color),
    );
  }
}
