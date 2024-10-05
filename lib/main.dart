import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:untitled14/network/api.dart';
import 'package:untitled14/screens/fav_screen.dart';
import 'package:untitled14/screens/provider/list_provider.dart';

import 'screens/home.dart';

void main() {
  ApiService(Dio()).fetchQuote();
  runApp(
    ChangeNotifierProvider<ListProvider>(
        create: (_) => ListProvider(),
        child: const MyApp()
    ),
  );


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
     routes: {
        MyHomePage.routeName:(_)=> MyHomePage(),
       FavScreen.routeName:(_)=>const FavScreen()
     },
    );
  }
}
