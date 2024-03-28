import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          width: 45,
        ),
        Text(
          "Department Name",
          style: TextStyle(
              fontFamily: "Roboto", fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 60,
        ),
        Text(
          "Position",
          style: TextStyle(
              fontFamily: "Roboto", fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "Points",
          style: TextStyle(
              fontFamily: "Roboto", fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
