import 'package:flutter/material.dart';
import 'package:user/widgets/department_card.dart';

class DepartmentCardList extends StatelessWidget {
  const DepartmentCardList({super.key, required this.departmentList});

  final List<List<dynamic>> departmentList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < departmentList.length; i++)
          Column(
            children: [
              DepartmentCard(
                name: departmentList[i][0],
                pos: i + 1,
                points: departmentList[i][1][0],
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
