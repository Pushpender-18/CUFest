import 'package:admin/data_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class DataUploader extends StatelessWidget {
  const DataUploader({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> department_names = [
      "Academic Unit-1 CSE,CSE-AIT(1st Year)",
      "Academic Unit-2 CSE(1st Year)",
      "Academic Unit-3 None-CSE(1st Year)",
      "Academic Unit-4 CSE(1st Year)",
      "Academic Unit-5 CSE(1st Year)",
      "Department of Aerospace Engineering",
      "Department of Computer Science & Enginnering-APEX",
      "Department of Automobile Engineering",
      "Department of Biotechnology Engineering",
      "Department of Chemical Engineering",
      "Department of Civil Engineering",
      "Department of Computer Science & Engineering-2nd Year",
      "Department of Computer Science & Engineering-3rd Year",
      "Department of Computer Science & Engineering-4th Year",
      "Department of Electronics & Communication Engineering",
      "Department of Electrical Engineering",
      "Department of Mechanical Engineering",
      "Department of Mechatronics Engineering",
      "Department of Petroleum Engineering",
      "Department of Liberal Arts",
      "Department of Psychology",
      "Department of English",
      "Department of Animation, VFX & Gaming",
      "Department of Film Studies",
      "Department of Fashion & Design",
      "Department of Industrial Design",
      "Department of Interior Design",
      "Department of Agriculture",
      "Department of Pharma Sciences",
      "Department of Architecture",
      "Department of Hospitality",
      "Department of Tourism",
      "Department of Airlines",
      "Department of Science (Nutrition & Detetics)",
      "Department of Optometry",
      "Department of Medical Lab Technology",
      "Department of Forensic Sciences",
      "Department of Physiotherapy",
      "Department of Education",
      "Department of Physical Education",
      "Department of Biosciences",
      "Department of Biotechnology",
      "Department of Media Studies",
      "Department of Computer Applications",
      "Department of Legal Studies",
      "Department of Legal Studies(LLB\\LLM)",
      "Department of Chemistry",
      "Department of Mathematics",
      "Department of Physics",
      "Department of Business Management(BBA)",
      "Department of Business Management(BBA-APEX)",
      "Department of Commerce",
      "Department of Business Management(MBA-APEX)",
      "Department of Business Management(MBA)",
      "Department of Business Management(Economics)",
      "Bachelor of Commerce(ACCA)",
      "Bachelor of Business Administration(ACCA)",
      "Master of Commerce(ACCA)",
      "Department of Nursing",
    ];

    List<String> eventList = [
      "Modelling",
      "On the spot Painting",
      "Collage Making",
      "Clay Modeling",
      "Rangoli",
      "Cartooning",
      "Installation-Best out of waste",
      "Face Painting",
      "Poster Making",
      "On the spot Photography",
      "Mehandi",
      "Mime",
      "Mimicry",
      "Beat Boxing",
      "Mono acting",
      "Standup Comedy",
      "Street Play",
      "Skit",
      "Solo Singing",
      "Western Vocal Solo",
      "Rap Battle",
      "Indian Group Song",
      "Western Group Song",
      "Light Vocal - Gazal",
      "Folk Song Solo",
      "DJ Hunt",
      "Solo Dance",
      "Folk Group Dance of Punjab (Boys)",
      "Folk Group Dance of Punjab (Girls)",
      "International Folk Group Dance",
      "General Group Dance",
      "Folk Dance - Solo",
      "Duet Dance",
      "Western Group Dance",
      "Classical Dance-Solo",
      "Debate",
      "Quiz",
      "Poetry",
    ];

    final departmentProvider = Provider.of<DepartmentRepository>(context);
    final eventRep = Provider.of<EventRepository>(context);
    //for (String name in eventList) {
    //  eventRep.setData(name);
    //}

    for (String name in department_names) {
      departmentProvider.setData(name, 0);
    }

    return Placeholder();
  }
}
