import 'package:flutter/cupertino.dart';

class ListProvider extends ChangeNotifier {
  List<int> favList = [];


  addList(int value) {
    favList.add(value);
    notifyListeners();
  }

  removeList(int value) {
    favList.remove(value);
    notifyListeners();
  }
}
