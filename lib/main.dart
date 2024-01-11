import 'package:flutter/material.dart';
import 'Models/HomePage.dart';

void main() => runApp(EnglishEducation());

class EnglishEducation extends StatelessWidget {
  const EnglishEducation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      title: 'ENGLISH EDUCATION',
      home : HomePage(),
    );
  }
}

