import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventRepository extends ChangeNotifier {
  EventRepository();

  final CollectionReference collection =
      FirebaseFirestore.instance.collection('events');

  List<Map<String, Map<String, dynamic>>> getData() {
    //  Event Data Format
    List<Map<String, Map<String, dynamic>>> eventData = [];
    collection.get().then((value) {
      final events = value.docs;
      for (QueryDocumentSnapshot event in events) {
        final data = event.data() as Map<String, dynamic>;
        eventData.add({event.id: data});
      }
    });
    return eventData;
  }
}

class DepartmentRepository extends ChangeNotifier {
  DepartmentRepository();

  final collection = FirebaseFirestore.instance.collection('departments');

  Map<String, Map<String, dynamic>> getData() {
    //  Department Data Format
    Map<String, Map<String, dynamic>> graphData = {};
    collection.get().then((value) {
      final standings = value.docs;
      for (QueryDocumentSnapshot standing in standings) {
        final data = standing.data() as Map<String, dynamic>;
        graphData[standing.id] = data;
      }
    });
    return graphData;
  }
}

class ScreenState extends ChangeNotifier {
  ScreenState();
}
