import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:newyorktimesapp/components/index.dart';




void main() {
  runApp(const Dashboard());
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NewyorktimesScreen(),
    );
  }
}
