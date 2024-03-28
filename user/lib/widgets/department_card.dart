import 'package:flutter/material.dart';

class DepartmentCard extends StatelessWidget {
  const DepartmentCard(
      {super.key, required this.name, required this.pos, required this.points});

  final String name;
  final int points;
  final int pos;

  @override
  Widget build(BuildContext context) {
    final List<Color> barColors = [
      const Color.fromARGB(255, 126, 48, 225),
      const Color.fromARGB(255, 137, 102, 247),
      const Color.fromARGB(255, 99, 166, 255),
      const Color.fromARGB(255, 67, 215, 239),
      const Color.fromARGB(255, 162, 162, 204),
    ];
    return Container(
      height: 70,
      width: 337,
      decoration: BoxDecoration(
        color: pos < 6
            ? barColors[pos - 1]
            : const Color.fromARGB(255, 247, 247, 247),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black26, spreadRadius: 4, blurRadius: 15),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 180,
            child: Text(
              name,
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: pos < 6 ? Colors.white : Colors.black,
              ),
            ),
          ),
          Text(
            pos.toString(),
            style: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: pos < 6 ? Colors.white : Colors.black,
            ),
          ),
          Text(
            points.toString(),
            style: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: pos < 6 ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
