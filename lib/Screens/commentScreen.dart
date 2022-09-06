import 'package:flutter/material.dart';
import 'package:interview_app/Screens/thankyouScreen.dart';
import 'package:interview_app/constants/constants_file.dart';

class CommentScreen extends StatefulWidget {
  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  int words = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kbackgroundColor,
      body: Container(
        padding: EdgeInsets.all(20),
        color: kbackgroundColor,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              // color: Colors.indigoAccent,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'COMMENTS (OPTIONAL)',
                    style: TextStyle(color: kheadingTextColor),
                  ),
                  Text(
                    '${words.toString()}/240',
                    style: TextStyle(color: kheadingTextColor),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                // color: Colors.blue,
                width: double.infinity,
                height: 500,
                child: TextFormField(
                  enabled: (words <= 240),
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      if (value != null) {
                        words = value.split(' ').length - 1;
                        print(words);
                      }
                    });
                  },
                  autofocus: true,
                  maxLines: 20,
                  style: TextStyle(fontSize: 30),
                  decoration: InputDecoration(
                      hintText: 'Write your review',
                      hintStyle: TextStyle(color: kheadingTextColor),
                      border: InputBorder.none),
                ),
              ),
            )
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ThankYouScreen()));
              },
              child: const Text(
                'SKIP',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ThankYouScreen()));
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
    ));
  }
}
