import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
  List todoList =[];
  //reference the box
  final _mybox = Hive.box('mybox');

  //run this method if is the first time ever opening this app

  void createInitialData(){
    todoList = [
      ['Click my box', false],
      ['Swip me left', false]
    ];
  }

  //load the data from the data base
  void loadData(){
    todoList = _mybox.get('TODOLIST');
  }

  //update the database
  void updateDataBase(){
    _mybox.put('TODOLIST',todoList);
  }

}