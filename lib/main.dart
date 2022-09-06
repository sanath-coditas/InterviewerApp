import 'dart:async';
import 'package:flutter/material.dart';
import 'package:interview_app/Screens/homescreen.dart';
import 'package:interview_app/Screens/qualities_screen.dart';
import 'package:interview_app/Screens/rating_screen.dart';
import 'package:interview_app/Screens/splashscreen.dart';
import 'package:interview_app/models/interviewers.dart';
import 'package:interview_app/models/rating_model.dart';
import 'package:provider/provider.dart';
void main() {

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider<InterViewerProvider>(create: (context)=>InterViewerProvider()),
       ChangeNotifierProvider<RatingProvider>(create: (context)=>RatingProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red),
        routes: {
          RatingScreen.routeName : (context) => RatingScreen(),
          QualitiesScreen.routeName : (context)=>QualitiesScreen(),
        },
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => HomeScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
