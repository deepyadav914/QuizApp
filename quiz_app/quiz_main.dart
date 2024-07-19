import 'package:flutter/material.dart';
import 'package:flutter_fundamentals/quiz_app/homescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Quiz App',
      home: HomeScreen()
    );
  }
}
