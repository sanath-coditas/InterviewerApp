import 'package:flutter/material.dart';
import 'package:interview_app/Screens/commentScreen.dart';
import 'package:interview_app/Screens/thankyouScreen.dart';
import 'package:interview_app/constants/constants_file.dart';
import 'package:interview_app/Providers/rating_model.dart';
import 'package:interview_app/widgets/category_selector.dart';
import 'package:provider/provider.dart';

class QualitiesScreen extends StatelessWidget {
  static const routeName = '/qualitiesScreen';
  @override
  Widget build(BuildContext context) {
    var selectedRating = Provider.of<RatingProvider>(context).getSelected();
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: kbackgroundColor,
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Container(
                  margin: EdgeInsets.only(right: 110),
                  child: const Text(
                    'YOU HAVE RATED YOUR INTERVIEWER',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Card(
                elevation: 70,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 27, 193, 3),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        selectedRating.emoji,
                        style: TextStyle(fontSize: 50),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selectedRating.review,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                          ),
                          FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              selectedRating.description,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'CHANGE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 80, top: 50),
                // color: Colors.green,
                width: 300,
                child: Text(
                  'What made the interviewers ${selectedRating.review.toLowerCase()}?',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              CategorySelector(),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 50.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CommentScreen()));
                },
                child: Row(
                  children: const [
                    Icon(Icons.mode_comment_outlined),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      'ADD COMMENT',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 140,
              child: FloatingActionButton(
                elevation: 20,
                backgroundColor: Colors.green,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ThankYouScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      'SUBMIT',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.check_rounded, color: Colors.white)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
