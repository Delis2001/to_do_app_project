import 'package:flutter/material.dart';
import 'package:to_do_app/models/note_category_model.dart';

class NoteCategoryProvider extends ChangeNotifier{
  List<NoteCategoryModel> _notes= [];
List<NoteCategoryModel> get note => _notes;

void addCategory(NoteCategoryModel note){
  _notes.add(note);
  notifyListeners();
}
void removeCategory(int index){
  _notes.removeAt(index);
  notifyListeners();
}
}