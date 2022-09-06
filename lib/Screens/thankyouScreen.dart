import 'package:flutter/material.dart';
import 'package:interview_app/constants/constants_file.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
              image: AssetImage(
                  "lib/assets/images/img.png"
              )

          )
        ),
      ),
    );
  }
}
