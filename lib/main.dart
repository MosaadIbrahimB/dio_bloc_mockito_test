import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled14/network/api.dart';

import 'screens/home.dart';

void main() {
  ApiService(Dio()).fetchQuote();
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
