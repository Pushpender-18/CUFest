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
        if (sortedEventData[min][1]['pos'] > sortedEventData[j][1]['pos']) {
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
    List<List<dynamic>> eventData = eventRepository.eventData;
    eventData = eventDataSort(eventData);

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
              Text(
                eventProvider.choosenEvent,
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
              const DepartmentHeading(),
              const SizedBox(height: 12),
              for (int i = 0; i < eventData.length; i++)
                DepartmentMiniCard(sNo: i + 1, depName: eventData[i][0]),
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
