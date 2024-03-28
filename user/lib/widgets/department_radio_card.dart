import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user/data_provider.dart';

class DepartmentRadioCard extends StatefulWidget {
  const DepartmentRadioCard({super.key, required this.departmentName});

  final String departmentName;
  @override
  State<DepartmentRadioCard> createState() => _DepartmentRadioCardState();
}

class _DepartmentRadioCardState extends State<DepartmentRadioCard> {
  bool tickFlag = false;

  @override
  Widget build(BuildContext context) {
    final departmentProvider = Provider.of<DepartmentProvider>(context);

    return Container(
      width: 158,
      height: 49,
      decoration: const BoxDecoration(
        color: Color(0xfffbfafa),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 12,
          ),
          TextButton.icon(
            onPressed: () {
              setState(() {
                if (departmentProvider.choosenDepartment ==
                    widget.departmentName) {
                  departmentProvider.update('');
                } else {
                  departmentProvider.update(widget.departmentName);
                }
              });
            },
            icon: Icon(
              departmentProvider.choosenDepartment == widget.departmentName
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank_rounded,
              color: const Color(0xff121213),
            ),
            label: SizedBox(
              width: 80,
              child: Text(
                widget.departmentName,
                style: TextStyle(
                  fontFamily: 'Robot',
                  fontSize: widget.departmentName.length > 30 ? 6 : 9,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff121213),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
