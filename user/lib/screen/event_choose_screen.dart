import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user/data_provider.dart';
import 'package:user/widgets/event_radio_card.dart';

class EventChooseScreen extends StatefulWidget {
  const EventChooseScreen({super.key});

  @override
  State<EventChooseScreen> createState() => _EventChooseScreenState();
}

class _EventChooseScreenState extends State<EventChooseScreen> {
  List<String> getEventNames(EventRepository eventData) {
    List<String> eventNames = [];

    for (List<dynamic> event in eventData.getEventData) {
      eventNames.add(event[0]);
    }
    return eventNames;
  }

  List<String> event15 = [
    "Solo Singing",
    "Light Vocal - Gazal",
    "On the spot painting",
    "Collage Making",
    "Skit",
    "Mono Acting",
    "Standup Comedy",
    "Folk Solo",
    "Solo Dance",
    "Poetry",
    "Western Vocal Solo",
    "Western Group Song",
    "Clay Modelling",
    "Rangoli",
    "DJ Hunt",
    "Mime",
    "Mimicry",
    "Classical Dance Solo",
    "Duet Dance",
  ];

  List<String> event16 = [
    "Folk Song Solo",
    "Rap Battle",
    "Installation-Best out of waste",
    "On the spot Photography",
    "Cartooning",
    "Modeling",
    "International Folk Group Dance",
    "Western Group Dance",
    "Quiz",
    "Debate",
    "Poster Making",
    "Mehandi",
    "Folk\\Trible Group Dance",
  ];

  Future<void> emptyEventAlertBox(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text("Choose an Event"),
        content: const Text("Please choose an event to show its details."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text("ok"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final eventData = Provider.of<EventRepository>(context);
    final screenStateProvider = Provider.of<ScreenStateProvider>(context);
    final eventProvider = Provider.of<EventProvider>(context);
    List<String> eventNames = getEventNames(eventData);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  screenStateProvider.update(ScreenState.score);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "Choose Event",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 75,
              ),
              Builder(
                builder: (context) {
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        if (eventProvider.event.isEmpty) {
                          emptyEventAlertBox(context);
                        } else {
                          screenStateProvider.update(ScreenState.event);
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 28,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: Container(
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
                height: 13,
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
                        spreadRadius: 2,
                      )
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "15 March 2024",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 6,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(color: Colors.black54, width: 3),
                    ),
                  ),
                  child: GridView.count(
                    crossAxisCount: eventNames.length < 2 ? 1 : 2,
                    padding: const EdgeInsets.fromLTRB(12, 25, 12, 25),
                    mainAxisSpacing: 25,
                    crossAxisSpacing: 20,
                    childAspectRatio: 3.2,
                    children: [
                      for (String eventName in event15)
                        EventRadioCard(eventName: eventName),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "16 March 2024",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 6,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border.fromBorderSide(
                      BorderSide(color: Colors.black54, width: 3),
                    ),
                  ),
                  child: GridView.count(
                    crossAxisCount: eventNames.length < 2 ? 1 : 2,
                    padding: const EdgeInsets.fromLTRB(12, 25, 12, 25),
                    mainAxisSpacing: 25,
                    crossAxisSpacing: 20,
                    childAspectRatio: 3.2,
                    children: [
                      for (String eventName in event16)
                        EventRadioCard(eventName: eventName),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
