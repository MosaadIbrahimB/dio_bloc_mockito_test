import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled14/screens/provider/list_provider.dart';
import 'package:untitled14/screens/widget/fav-widget.dart';

class FavScreen extends StatelessWidget {
  static const String routeName="FavScreen";

  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ListProvider>(context);

    return  Scaffold(
      appBar: AppBar(
        title: const Text("FavScreen"),
      ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ListView.builder(
              itemCount: provider.favList.length,
              itemBuilder: (context, index) {
                return FavItemListWidget(index: index);
              }),
        ),
      ),
    );
  }
}
