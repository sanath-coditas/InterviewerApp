import 'package:flutter/material.dart';
import 'package:interview_app/models/interviewers.dart';
import 'package:provider/provider.dart';

class InterviewerTile extends StatelessWidget {
  Interviewer interviewer;
  InterviewerTile({required this.interviewer});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        interviewer.name,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: interviewer.isAdded ? Colors.blue : Colors.black,
        ),
      ),
      subtitle: Text(interviewer.designation),
      trailing: GestureDetector(
        child: Text(
          interviewer.isAdded ? 'REMOVE' : 'ADD',
          style: const TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold),
        ),
        onTap: () {
          Provider.of<InterViewerProvider>(context, listen: false)
              .toggleAdded(interviewer);
        },
      ),
    );
  }
}
