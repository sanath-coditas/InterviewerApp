import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: const BoxDecoration(
       image: DecorationImage(
         fit: BoxFit.fill,
         image: AssetImage('lib/assets/images/SplashScreen.png')
       )
     ),
    );
  }
}
