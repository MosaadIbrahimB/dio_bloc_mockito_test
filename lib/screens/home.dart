import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled14/screens/fav_screen.dart';
import 'package:untitled14/screens/provider/list_provider.dart';
import 'package:untitled14/screens/widget/item_list_widget.dart';

class MyHomePage extends StatelessWidget {
  static const String routeName = "MyHomePage";



  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
        actions: [
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, FavScreen.routeName);
              },
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 35,
              ))
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ItemListWidget(index: index);
              }),
        ),
      ),
    );
  }
}

