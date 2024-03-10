import 'package:flutter/material.dart';

class DepartmentMiniCard extends StatelessWidget {
  const DepartmentMiniCard(
      {super.key, required this.sNo, required this.depName});

  final int sNo;
  final String depName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 336,
      decoration: const BoxDecoration(
        color: Color(0xfffbfafa),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 4, blurRadius: 15),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 29,
          ),
          Text(
            sNo.toString() + '.',
            style: const TextStyle(
              fontFamily: 'Robto',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            width: 95,
          ),
          Text(
            depName,
            style: const TextStyle(
              fontFamily: 'Robto',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

class DepartmentHeading extends StatelessWidget {
  const DepartmentHeading({super.key});

  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 336,
      decoration: const BoxDecoration(
        color: Color(0xffa2a2ac),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 4, blurRadius: 15),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
          ),
          Text(
            "Pos.",
            style: TextStyle(
              fontFamily: 'Robto',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xfffbfafa),
            ),
          ),
          SizedBox(
            width: 61,
          ),
          Text(
            "Department",
            style: TextStyle(
              fontFamily: 'Robto',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xfffbfafa),
            ),
          )
        ],
      ),
    );
  }
}
