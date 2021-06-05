import 'package:flutter/material.dart';
import 'package:wits_overflow/screens/home_screen.dart';
import 'package:wits_overflow/screens/sign_in_screen.dart';

class WitsOverflowApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wits Overflow',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      //home: SignInScreen(),
      home: HomeScreen(),
    );
  }
}
