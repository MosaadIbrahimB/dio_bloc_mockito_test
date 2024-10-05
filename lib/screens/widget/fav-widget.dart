import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/list_provider.dart';

class FavItemListWidget extends StatelessWidget {
  int index ;

  FavItemListWidget({super.key, required this.index });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ListProvider>(context);
    int indexFavList=provider.favList[index];
    return Container(

      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        elevation: 4,
        child: Container(
          alignment: Alignment.center,
          width: 100,
          height: 80,
          child: ListTile(
            leading: CircleAvatar(backgroundColor: Colors.primaries[indexFavList]),
            title: Text(
              "text $indexFavList",
              style: const TextStyle(fontSize: 30),
            ),
            trailing: InkWell(
                onTap: () {
                  provider.removeList(indexFavList);
                  debugPrint(provider.favList.toString());
                },
                child:  const Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.red,
                )

            ),
          ),
        ),
      ),
    );
  }
}
