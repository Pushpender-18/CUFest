import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user/data_provider.dart';
import 'package:user/widgets/bar_graph.dart';
import 'package:user/widgets/department_card_list.dart';
import 'package:user/widgets/labels.dart';
import 'package:url_launcher/url_launcher.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  List<String> getDepNamesForGraph(List<List<dynamic>> depData) {
    List<String> departmentNames = [];

    for (List<dynamic> department in depData) {
      departmentNames.add(department[0]);
    }

    return departmentNames;
  }

  List<int> getDepPointsForGraph(List<List<dynamic>> depData) {
    List<int> points = [];

    for (List<dynamic> department in depData) {
      points.add(department[1][0]);
    }

    return points;
  }

  _launchURLBrowser() async {
    var uri = Uri.parse(
        "https://www.instagram.com/cufest_daca?igsh=MWU3azQzcHJmZXIyYg==");
    await launchUrl(uri);
  }

  List<List<dynamic>> getDepDataForCards(DepartmentRepository depData) {
    List<List<dynamic>> data = depData.depData;

    for (int i = 0; i < data.length; i++) {
      int min = i;
      List<dynamic> temp = [];
      for (int j = i + 1; j < data.length; j++) {
        if (data[min][1][0] > data[j][1][0]) {
          min = j;
        }
      }
      temp = data[i];
      data[i] = data[min];
      data[min] = temp;
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final eventData = Provider.of<EventRepository>(context);
    final departmentRepository = Provider.of<DepartmentRepository>(context);
    final screenStateProvider = Provider.of<ScreenStateProvider>(context);
    final departmentData =
        getDepDataForCards(departmentRepository).reversed.toList();

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
                  Row(children: [
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
                    )
                  ]),
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
            departmentRepository.updateData();
            eventData.updateData();
            return Future.delayed(Duration.zero);
          },
          child: ListView(
            children: [
              Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(255, 221, 220, 220),
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
                      height: 23,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/insta_logo.png',
                            height: 50,
                            width: 50,
                          ),
                          TextButton(
                            onPressed: _launchURLBrowser,
                            child: const Text(
                              "Visit Our Insta page for Live Feed",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.pink,
                              ),
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    BarGraph(
                      dNames: getDepNamesForGraph(
                        departmentData.sublist(
                            0, min(departmentData.length, 5)),
                      ),
                      p: getDepPointsForGraph(
                        departmentData.sublist(
                            0, min(departmentData.length, 5)),
                      ),
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
                      height: 35,
                    ),
                    const Label(),
                    const SizedBox(
                      height: 15,
                    ),
                    departmentData.isEmpty
                        ? SizedBox(
                            height: height - 400,
                            child: const Center(
                              child: Icon(
                                Icons.coffee,
                                size: 150,
                                color: Colors.black12,
                              ),
                            ),
                          )
                        : DepartmentCardList(
                            departmentList: departmentData,
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
