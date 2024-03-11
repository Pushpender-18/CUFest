import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user/data_provider.dart';
import 'package:user/widgets/event_card.dart';

class DepartmentScreen extends StatelessWidget {
  const DepartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final departmentProvider = Provider.of<DepartmentProvider>(context);
    final screenStateProvider = Provider.of<ScreenStateProvider>(context);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          elevation: 5,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  screenStateProvider.update(ScreenState.score);
                  departmentProvider.update('');
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 26,
                ),
              ),
              Text(
                departmentProvider.choosenDepartment,
                style: const TextStyle(
                  color: Color(0xff121213),
                  fontFamily: 'Roboto',
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
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
            children: [
              const SizedBox(
                height: 18,
              ),
              const EventHeading(),
              const SizedBox(height: 12),
              EventCard(sNo: 1, eventName: "Test", pos: 1),
              //for (int i = 0; i < eventData.length; i++)
              //  DepartmentMiniCard(sNo: i + 1, depName: eventData[i][0]),
              const SizedBox(
                height: 9,
              )
            ],
          ),
        ),
      ),
    );
  }
}
