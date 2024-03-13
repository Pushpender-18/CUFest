import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum ScreenState { score, departmentChoose, eventChoose, department, event }

class EventRepository extends ChangeNotifier {
  EventRepository();

  final CollectionReference collection =
      FirebaseFirestore.instance.collection('events');

  List<List<dynamic>> eventData = [];

  List<List<dynamic>> get getEventData => eventData;

  void updateData() {
    //  Event Data Format
    collection.get().then((value) {
      final events = value.docs;
      for (QueryDocumentSnapshot event in events) {
        final data = event.data() as Map<String, dynamic>;
        eventData.add([event.id, data]);
      }
    });
    notifyListeners();
  }
}

class DepartmentRepository extends ChangeNotifier {
  DepartmentRepository();

  final collection = FirebaseFirestore.instance.collection('departments');
  List<List<dynamic>> depData = [];

  List<List<dynamic>> get getDepartmentData => depData;

  void updateData() async {
    //  Department Data Format
    depData = [];
    await collection.get().then((value) {
      final standings = value.docs;
      for (QueryDocumentSnapshot standing in standings) {
        Map<String, dynamic> d = standing.data() as Map<String, dynamic>;
        List<dynamic> data = d.entries.map((e) => e.value).toList();
        depData.add([standing.id, data]);
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

class EventProvider extends ChangeNotifier {
  EventProvider();

  String choosenEvent = "";

  String get event => choosenEvent;

  void update(String newEvent) {
    choosenEvent = newEvent;
    notifyListeners();
  }
}

class DepartmentProvider extends ChangeNotifier {
  DepartmentProvider();

  String choosenDepartment = "";

  String get event => choosenDepartment;

  void update(String newDepartment) {
    choosenDepartment = newDepartment;
    notifyListeners();
  }
}
