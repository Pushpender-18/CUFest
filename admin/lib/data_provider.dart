import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum ScreenState { score, add }

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
      print(eventData.length);
    });
    notifyListeners();
  }

  void setData(String name) {
    collection.doc(name).set({
      'NaN': 0,
    });
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
      print(depData.length);
    });
    notifyListeners();
  }

  void setData(String name, int points) async {
    await collection.doc(name).set(
      {"points": points},
    );
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
