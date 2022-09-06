import 'package:flutter/material.dart';
import 'package:interview_app/Screens/qualities_screen.dart';
import 'package:interview_app/Screens/rating_screen.dart';
import 'package:interview_app/constants/constants_file.dart';
import 'package:interview_app/Providers/interviewers.dart';
import 'package:interview_app/widgets/interviewer_tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    InterViewerProvider interviewerProvider =
        Provider.of<InterViewerProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: kbackgroundColor,
        body: Container(

          color: kbackgroundColor,
          margin: EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 60, bottom: 30, left: 14),
                // color: Colors.red,
                width: double.infinity,
                child: const Text(
                  'Interviewers',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(15),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      suffixIcon: Icon(Icons.search),
                      hintText: 'Search Interviewers'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                width: double.infinity,
                child: Text(
                  '${interviewerProvider.countOfAdded} ADDED',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.builder(
                    itemCount: interviewerProvider.getInterviewers.length,
                    itemBuilder: (context, index) => InterviewerTile(
                    interviewer: interviewerProvider.getInterviewers[index]),
              ))
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          width: 130,
          child: FloatingActionButton(
            elevation: 10,
            backgroundColor: (interviewerProvider.addedCount>0)?Colors.green:Color.fromRGBO(153, 158, 178, 2),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            onPressed: () {
              if(interviewerProvider.addedCount > 0)
              Navigator.pushNamed(context,RatingScreen.routeName);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                Text(
                  'NEXT',
                  style: TextStyle(
                      color:(interviewerProvider.addedCount>0)?Colors.white:Colors.black45,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_forward_ios,
                  color: (interviewerProvider.addedCount>0)?Colors.white:Colors.black45 ,
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
