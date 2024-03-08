import 'package:flutter/material.dart';
import 'package:user/widgets/bar.dart';

class BarGraph extends StatelessWidget {
  const BarGraph({super.key, required this.depNames, required this.points});

  final List<String> depNames;
  final List<int> points;

  int getMax(List<int> points) {
    points.sort();
    return points[-1];
  }

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
      height: 198,
      width: 337,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 4,
            blurRadius: 15,
          ),
        ],
        color: Color.fromARGB(255, 247, 247, 247),
      ),
      child: depNames.isEmpty
          ? const Center(
              child: Text(
                "There is no data to show",
                style: TextStyle(
                  fontFamily: 'Robot',
                  fontSize: 16,
                  color: Color(0xaa121213),
                ),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 28,
                    ),
                    Bar(
                      heightRatio: 1,
                      color: barColors[0],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 29,
                ),
              ],
            ),
    );
  }
}
