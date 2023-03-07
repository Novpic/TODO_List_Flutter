import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_list_basic/data/database.dart';
import 'package:to_do_list_basic/pages/todo_tile.dart';

import '../util/dialog_box.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _mybox = Hive.box('mybox');

  @override
  void initState(){
    //if first time oppenin the app
    if(_mybox.get('TODOLIST')== null){
      db.createInitialData();
    }
    else{
      //alredy exit data
      db.loadData();
    }
  }
  final _controler = TextEditingController();
  ToDoDataBase db = ToDoDataBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TO DO LIST', style: TextStyle(color:Colors.black, )),
        centerTitle: true, backgroundColor: Colors.blue[300],) ,
      backgroundColor: Colors.blue[100],
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: listbuilder(),
    );
  }


  void createNewTask(){
    showDialog(
      context: context,
       builder: (context){
        return DialogBox(
          controller: _controler,
          onSaved: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),);
    });
  }
  ListView listbuilder(){
    return ListView.builder(
      itemCount: db.todoList.length,
      itemBuilder: (context, index){
        return TodoTile(
          title: db.todoList[index][0],
          boxState: db.todoList[index][1],
          onChanged:(value) => onChanged(value, index),
          deleteAction: (context)=>deleteTile(index),);
      },
    );
  }
  //change checkbox state
  void onChanged (bool? boxState, int index){
    setState(() {
      db.todoList[index][1]=!db.todoList[index][1];
    });
    db.updateDataBase();
  }

  //Delete tile
  void deleteTile(int index){
    setState((){
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
    
  }
  //save new task
  void saveNewTask(){
    setState(() {
      db.todoList.add([_controler.text, false]);
      Navigator.of(context).pop();
      _controler.clear();
    });
    db.updateDataBase();
  }
}