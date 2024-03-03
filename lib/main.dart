import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          primary: Colors.amber,
          onPrimary: Colors.black87,
          secondary: Colors.brown[700],
          onSecondary: Colors.amberAccent,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white10,
      ),
      home: const Home(),
    );
  }
}
