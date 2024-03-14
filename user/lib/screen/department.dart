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
    final eventRepository = Provider.of<EventRepository>(context);
    final eventsData = eventRepository.eventData;
    List<dynamic> departmentData = [];
    for (var eventData in eventsData) {
      for (var data in eventData[1]) {
        if (data[0] == departmentProvider.choosenDepartment) {
          departmentData.add([eventData[0], data[1]]);
        }
      }
    }

    print(departmentData);

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
              SizedBox(
                width: 250,
                child: Text(
                  departmentProvider.choosenDepartment,
                  style: TextStyle(
                    color: const Color(0xff121213),
                    fontFamily: 'Roboto',
                    fontSize: departmentProvider.choosenDepartment.length > 30
                        ? 9
                        : departmentProvider.choosenDepartment.length > 20
                            ? 12
                            : 16,
                  ),
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
              departmentData.isEmpty
                  ? const SizedBox(
                      height: 400,
                      child: Center(
                        child: Icon(
                          Icons.coffee,
                          size: 150,
                          color: Colors.black12,
                        ),
                      ),
                    )
                  : const SizedBox(),
              for (int i = 0; i < departmentData.length; i++)
                Row(
                  children: [
                    EventCard(
                        sNo: i + 1,
                        eventName: departmentData[i][0],
                        pos: departmentData[i][1]),
                    const SizedBox(
                      height: 9,
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
