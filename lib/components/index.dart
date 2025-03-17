import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:newyorktimesapp/models/news.dart';





void main() {
  runApp(const NewyorktimesScreen());
}

class NewyorktimesScreen extends StatelessWidget {
  const NewyorktimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NewyorktimesScreen(),
    );
  }
}
