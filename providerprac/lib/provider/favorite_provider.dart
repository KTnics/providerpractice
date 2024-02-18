import 'package:flutter/foundation.dart';

class favoriteitemprovider with ChangeNotifier{
  List<int> _selecteditems=[];
  List<int> get selecteditems =>_selecteditems;


void additems(int value){
  _selecteditems.add(value);
  notifyListeners();
}
void removeItems(int value){
  _selecteditems.remove(value);
  notifyListeners();
}
}
