import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum ScreenState { score, departmentChoose, eventChoose, department, event }

class EventRepository extends ChangeNotifier {
  EventRepository();

  final CollectionReference collection =
      FirebaseFirestore.instance.collection('events');

  List<Map<String, Map<String, dynamic>>> eventData = [];

  List<Map<String, Map<String, dynamic>>> get getEventData => eventData;

  void updateData() {
    //  Event Data Format
    collection.get().then((value) {
      final events = value.docs;
      for (QueryDocumentSnapshot event in events) {
        final data = event.data() as Map<String, dynamic>;
        eventData.add({event.id: data});
      }
    });
    notifyListeners();
  }
}

class DepartmentRepository extends ChangeNotifier {
  DepartmentRepository();

  final collection = FirebaseFirestore.instance.collection('departments');
  Map<String, Map<String, dynamic>> graphData = {};
  Map<String, Map<String, dynamic>> depData = {};

  Map<String, Map<String, dynamic>> get getGraphData => graphData;
  Map<String, Map<String, dynamic>> get getDepartmentData => depData;

  void updateData() async {
    //  Department Data Format
    await collection.get().then((value) {
      final standings = value.docs;
      for (QueryDocumentSnapshot standing in standings) {
        final data = standing.data() as Map<String, dynamic>;
        depData[standing.id] = data;
        if (data['pos'] < 6) {
          graphData[standing.id] = data;
        }
      }
    });
    notifyListeners();
  }
}

class ScreenStateProvider extends ChangeNotifier {
  ScreenStateProvider();

  ScreenState _state = ScreenState.score;

  ScreenState get state => _state;

  void update(ScreenState newState) {
    _state = newState;
    notifyListeners();
  }
}
