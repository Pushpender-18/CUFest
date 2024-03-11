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

  Future<void> emptyEventAlertBox(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text("Choose an Event"),
        content: const Text("Please choose and event to show its details."),
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
                height: 60,
              ),
              const SearchBar(
                constraints: BoxConstraints(
                  minWidth: 336,
                  maxWidth: 336,
                  minHeight: 50,
                ),
                textStyle: MaterialStatePropertyAll(
                  TextStyle(
                    fontFamily: 'Robot',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                backgroundColor: MaterialStatePropertyAll(
                  Color(0xfffbfafa),
                ),
                hintText: "Event Name",
                elevation: MaterialStatePropertyAll(8),
                textCapitalization: TextCapitalization.characters,
              ),
              const SizedBox(
                height: 29,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 26,
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
                    width: 120,
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
              Expanded(
                child: GridView.count(
                  crossAxisCount: eventNames.length < 2 ? 1 : 2,
                  padding: const EdgeInsets.fromLTRB(12, 25, 12, 25),
                  mainAxisSpacing: 25,
                  crossAxisSpacing: 20,
                  childAspectRatio: 3.2,
                  children: [
                    for (String eventName in eventNames)
                      EventRadioCard(eventName: eventName),
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
