import 'package:favorite/models/favorite_list_model.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class FavoritePageModel extends ChangeNotifier{
  late FavoriteListModel _favoritelist;
  final List<int> _itemIds = [];
  FavoriteListModel get favoritelist => _favoritelist;

  set favoritelist (FavoriteListModel newList){
    _favoritelist = newList;
    //notify listeners in case the new favorite list provider information
    //different from the previous one for examble availability of an item
    //might have changed
    notifyListeners();
  }

  ///List of item in the favorite page
List<Item> get items =>
    _itemIds.map((id) => _favoritelist.getById(id)).toList();

void add(Item item){
  _itemIds.add(item.id);
  //this line tells [model] that it should rebuild the widgets that
  //depends on it
  notifyListeners();
}


void remove(Item item){
  _itemIds.remove(item.id);
  //Don't forget to tell dependent widgets to rebuild _every time
  //you change the model
  notifyListeners();
}



}