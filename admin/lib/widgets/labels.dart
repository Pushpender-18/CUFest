import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({super.key, required this.depNames});

  final List<String> depNames;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 39,
        ),
        for (String depName in depNames)
          Row(
            children: [
              Text(
                depName,
                style: const TextStyle(
                  fontFamily: 'Robot',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 40,
              ),
            ],
          ),
      ],
    );
  }
}
