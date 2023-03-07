import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String title;
  final bool boxState;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteAction;


  TodoTile( {
    required this.title, 
    required this.boxState, 
    required this.onChanged,
    required this.deleteAction,
    super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:20.0,right: 20.0, top:20.0),
      child:Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteAction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10),)
          ],
        ),
        child: Container(
          
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            children: [
              Checkbox(value: boxState, onChanged:onChanged),
              Text(title,
                style: (TextStyle(decoration: boxState ? TextDecoration.lineThrough:TextDecoration.none))),
          ],
          ),
        ),
      )
    );
  }
}