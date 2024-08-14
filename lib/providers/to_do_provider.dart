import 'package:flutter/foundation.dart';
import 'package:to_do_app/models/to_do_model.dart';

class ToDoProvider extends ChangeNotifier{
 List<ToDoModel> _toDos= [];
List<ToDoModel> get toDo => _toDos;

void addCategory(ToDoModel toDo){
  _toDos.add(toDo);
  notifyListeners();
}
void removeToDo(int index){
  _toDos.removeAt(index);
  notifyListeners();
}
}