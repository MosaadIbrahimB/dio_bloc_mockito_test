import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/list_provider.dart';

class ItemListWidget extends StatelessWidget {
  int index ;

  ItemListWidget({super.key, required this.index });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ListProvider>(context);
    return Container(

      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        elevation: 4,
        child: Container(
          alignment: Alignment.center,
          width: 100,
          height: 80,
          child: ListTile(
            leading: CircleAvatar(backgroundColor: Colors.primaries[index]),
            title: Text(
             "text $index",
              style: const TextStyle(fontSize: 30),
            ),
            trailing: InkWell(
              onTap: () {
                provider.favList.contains(index)
                    ? provider.removeList(index)
                    : provider.addList(index);
                print(provider.favList);
              },
              child: provider.favList.contains(index)
                  ? const Icon(
                Icons.favorite,
                size: 30,
                color: Colors.red,
              )
                  : const Icon(
                Icons.favorite_border,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}




