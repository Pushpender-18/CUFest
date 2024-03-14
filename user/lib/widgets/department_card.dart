import 'package:flutter/material.dart';

class DepartmentCard extends StatelessWidget {
  const DepartmentCard(
      {super.key, required this.name, required this.pos, required this.points});

  final String name;
  final int points;
  final int pos;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 337,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 247, 247, 247),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
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
              style: const TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
          Text(
            pos.toString(),
            style: const TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          Text(
            points.toString(),
            style: const TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
