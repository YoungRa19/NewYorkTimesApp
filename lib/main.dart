import 'package:flutter/material.dart';
import 'package:newyorktimesapp/dashboard/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The New York Times',
      theme: ThemeData(

        primaryColor: Color(0xFF191919),
        hintColor: Color(0xFF777777),
        scaffoldBackgroundColor: Color(0xFF1C1C1D),

        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF000000),
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Estilos de iconos
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      home: const Dashboard(),
    );
  }
}