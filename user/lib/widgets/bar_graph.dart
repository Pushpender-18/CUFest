import 'package:flutter/material.dart';
import 'package:user/widgets/bar.dart';
import 'package:user/widgets/labels.dart';

class BarGraph extends StatelessWidget {
  const BarGraph({super.key, required this.depNames, required this.points});

  final List<String> depNames;
  final List<int> points;

  @override
  Widget build(BuildContext context) {
    final List<Color> barColors = [
      const Color.fromARGB(255, 126, 48, 225),
      const Color.fromARGB(255, 137, 102, 247),
      const Color.fromARGB(255, 99, 166, 255),
      const Color.fromARGB(255, 67, 215, 239),
      const Color.fromARGB(255, 162, 162, 204),
    ];

    int maxPoints = points.isEmpty ? 0 : points.first;
    List<double> heights = points.map((value) => value / maxPoints).toList();

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
                    for (double height in heights)
                      Bar(
                        heightRatio: height,
                        color: barColors[heights.indexOf(height)],
                      ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
                Label(depNames: depNames),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
    );
  }
}
