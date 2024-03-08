import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user/data_provider.dart';
import 'package:user/widgets/bar_graph.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  List<String> getDepNamesForGraph(DepartmentRepository depData) {
    return depData.graphData.keys.toList();
  }

  List<int> getDepPointsForGraph(DepartmentRepository depData) {
    List<int> points = [];
    Map<String, Map<String, dynamic>> data = depData.graphData;
    for (String depName in data.keys) {
      points.add(data[depName]!['points']);
    }
    return points;
  }

  @override
  Widget build(BuildContext context) {
    final depData = Provider.of<DepartmentRepository>(context);
    final screenStateProvider = Provider.of<ScreenStateProvider>(context);

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
              fontSize: 24,
            ),
          ),
        ),
        drawer: Drawer(
          width: 219,
          child: Row(
            children: [
              const SizedBox(
                width: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  const Text(
                    "List",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color(0xff121213),
                    ),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  TextButton(
                    onPressed: () {
                      screenStateProvider.update(ScreenState.eventChoose);
                    },
                    child: const Text(
                      "Events",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Color(0xff121213),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  TextButton(
                    onPressed: () {
                      screenStateProvider.update(ScreenState.departmentChoose);
                    },
                    child: const Text(
                      "Departments",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Color(0xff121213),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            depData.updateData();

            return Future.delayed(Duration.zero);
          },
          child: ListView(
            children: [
              Container(
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
                    BarGraph(
                      depNames: getDepNamesForGraph(depData),
                      points: getDepPointsForGraph(depData),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
