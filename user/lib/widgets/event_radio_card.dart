import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user/data_provider.dart';

class EventRadioCard extends StatefulWidget {
  const EventRadioCard({super.key, required this.eventName});

  final String eventName;

  @override
  State<EventRadioCard> createState() => _EventRadioCardState();
}

class _EventRadioCardState extends State<EventRadioCard> {
  bool tickFlag = false;

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);

    return Container(
      width: 158,
      height: 49,
      decoration: const BoxDecoration(
        color: Color(0xfffbfafa),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 12,
          ),
          TextButton.icon(
            onPressed: () {
              setState(() {
                if (eventProvider.choosenEvent == widget.eventName) {
                  eventProvider.update('');
                } else {
                  eventProvider.update(widget.eventName);
                }
              });
            },
            icon: Icon(
              eventProvider.choosenEvent == widget.eventName
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank_rounded,
              color: const Color(0xff121213),
            ),
            label: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                widget.eventName,
                style: const TextStyle(
                  fontFamily: 'Robot',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff121213),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
