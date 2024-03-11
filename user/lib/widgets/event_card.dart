import 'package:flutter/material.dart';

class EventHeading extends StatelessWidget {
  const EventHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 336,
      decoration: const BoxDecoration(
        color: Color(0xffa2a2ac),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 4, blurRadius: 15),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
          ),
          Text(
            "S No.",
            style: TextStyle(
              fontFamily: 'Robto',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xfffbfafa),
            ),
          ),
          SizedBox(
            width: 61,
          ),
          Text(
            "Event",
            style: TextStyle(
              fontFamily: 'Robto',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xfffbfafa),
            ),
          ),
          SizedBox(
            width: 72,
          ),
          Text(
            "Pos.",
            style: TextStyle(
              fontFamily: 'Robto',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xfffbfafa),
            ),
          )
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard(
      {super.key,
      required this.sNo,
      required this.eventName,
      required this.pos});

  final int sNo;
  final String eventName;
  final int pos;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 336,
      decoration: const BoxDecoration(
        color: Color(0xfffbfafa),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 4, blurRadius: 15),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 29,
          ),
          Text(
            sNo.toString() + '.',
            style: const TextStyle(
              fontFamily: 'Robto',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            eventName,
            style: const TextStyle(
              fontFamily: 'Robto',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            pos.toString(),
            style: const TextStyle(
              fontFamily: 'Robto',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            width: 76,
          ),
        ],
      ),
    );
  }
}
