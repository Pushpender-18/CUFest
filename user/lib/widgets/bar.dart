import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  const Bar({super.key, required this.heightRatio, required this.color});

  final double heightRatio;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 147 * heightRatio,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
    );
  }
}
