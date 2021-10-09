import 'package:flutter/material.dart';
import 'package:quiz/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(
        counter: 2,
        index: 2,
      ),
    );
  }
}
