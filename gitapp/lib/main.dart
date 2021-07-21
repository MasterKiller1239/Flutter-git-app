import 'package:flutter/material.dart';
import 'HomePage/home_page.dart';
import 'constants/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gitapp',
      theme: ThemeData.dark().copyWith(
          primaryColor: primaryDark,
          scaffoldBackgroundColor: primaryLight,
          brightness: Brightness.dark),
      home: HomePage(title: 'Gitapp'),
    );
  }
}
