import 'package:flutter/material.dart';

class Interviewer {
  String name;
  String designation;
  bool isAdded = false;
  Interviewer(
      {required this.name, required this.designation, required this.isAdded});
}

class InterViewerProvider extends ChangeNotifier {
  int addedCount = 0;
  final _interviewersList = [
    Interviewer(
      name: 'Amit Thakkar',
      designation: 'Tech Lead',
      isAdded: false,
    ),
    Interviewer(
        name: 'Amol Chaudary', designation: 'Tech Lead', isAdded: false),
    Interviewer(
        name: 'Bhojraj Bendale',
        designation: 'Software Developer',
        isAdded: false),
    Interviewer(
        name: 'Chandan Mishra', designation: 'Design Lead', isAdded: false),
    Interviewer(
        name: 'Dileep Kumar', designation: 'Software Engineer', isAdded: false),
    Interviewer(name: 'Gaurav Ghate', designation: 'Tech Lead', isAdded: false),
    Interviewer(
        name: 'Harish Kumar Soni',
        designation: 'Software Developer',
        isAdded: false),
  ];

  List<Interviewer> get getInterviewers {
    return [..._interviewersList];
  }

  void addInterviewer(Interviewer interviewer) {
    _interviewersList.add(interviewer);
    notifyListeners();
  }

  void toggleAdded(Interviewer interviewer) {
    _interviewersList[_interviewersList.indexOf(interviewer)].isAdded =
        !_interviewersList[_interviewersList.indexOf(interviewer)].isAdded;
    notifyListeners();
  }

  int get countOfAdded {
    addedCount = 0;
    for (var element in _interviewersList) {
      if (element.isAdded) {
        addedCount += 1;
      }
    }
    return addedCount;
  }
}
