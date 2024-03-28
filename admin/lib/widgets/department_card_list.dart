import 'package:flutter/material.dart';
import 'package:admin/widgets/department_card.dart';

class DepartmentCardList extends StatelessWidget {
  const DepartmentCardList({super.key, required this.departmentList});

  final List<List<dynamic>> departmentList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (List<dynamic> department in departmentList)
          Column(
            children: [
              DepartmentCard(
                name: department[0],
                pos: department[1][0],
                points: department[1][1],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
      ],
    );
  }
}
