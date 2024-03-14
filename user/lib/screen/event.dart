import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user/data_provider.dart';
import 'package:user/widgets/department_mini_card.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  List<List<dynamic>> eventDataSort(List<List<dynamic>> eventData) {
    List<List<dynamic>> sortedEventData = eventData;

    for (int i = 0; i < sortedEventData.length; i++) {
      int min = i;
      for (int j = i + 1; j < sortedEventData.length; j++) {
        if (sortedEventData[min][1][1] > sortedEventData[j][1][1]) {
          min = j;
        }
      }
      List<dynamic> temp = sortedEventData[min];
      sortedEventData[min] = sortedEventData[i];
      sortedEventData[i] = temp;
    }

    return sortedEventData;
  }

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
    final screenStateProvider = Provider.of<ScreenStateProvider>(context);
    final eventRepository = Provider.of<EventRepository>(context);
    List<List<dynamic>> d = eventRepository.eventData;
    List<dynamic> eventData = [];
    for (List<dynamic> data in d) {
      if (data[0] == eventProvider.choosenEvent) {
        eventData = data[1];
        break;
      }
    }

    if (eventData[0][0] == 'NaN') {
      eventData = [];
    }

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
                  eventProvider.update('');
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 26,
                ),
              ),
              SizedBox(
                width: 250,
                child: Text(
                  eventProvider.choosenEvent,
                  style: TextStyle(
                    color: const Color(0xff121213),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: eventProvider.choosenEvent.length > 30 ? 15 : 18,
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
              const DepartmentHeading(),
              const SizedBox(height: 12),
              eventData.isEmpty
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
              for (int i = 0; i < eventData.length; i++)
                Column(children: [
                  DepartmentMiniCard(sNo: i + 1, depName: eventData[i][0]),
                  const SizedBox(
                    height: 9,
                  ),
                ]),
            ],
          ),
        ),
      ),
    );
  }
}
