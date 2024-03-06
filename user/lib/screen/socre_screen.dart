import 'package:flutter/material.dart';
import 'package:user/widgets/department_card.dart';
import 'package:user/widgets/bar_graph.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          elevation: 5,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Text(
            "Score View",
            style: TextStyle(
              color: Color(0xff121213),
              fontFamily: 'Roboto',
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu_rounded),
            ),
          ],
        ),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 200, 200, 200),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 43,
              ),
              const BarGraph(
                depNames: [],
                points: [],
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                width: 336,
                height: 1,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(2),
                    ),
                    color: Color.fromARGB(2, 231, 229, 229),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 4,
                      )
                    ]),
              ),
              const SizedBox(
                height: 25,
              ),
              const DepartmentCard(name: "Demo Dep", points: 16, pos: 1),
            ],
          ),
        ),
      ),
    );
  }
}
