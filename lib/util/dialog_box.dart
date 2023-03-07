import 'package:flutter/material.dart';
import 'package:to_do_list_basic/util/my_material_butto.dart';

class DialogBox extends StatelessWidget {
  final controller;
  void Function() onSaved;
  void Function() onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSaved,
    required this.onCancel});

  @override
  Widget build(BuildContext context) {
    String newTask;
    return AlertDialog(
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Insert task'),
              onSubmitted: (text){onSaved();},
              ),
            Padding(padding: EdgeInsets.only(bottom: 10.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyMaterialButton(text: 'Save', onPressed: onSaved),
                MyMaterialButton(text: 'Cancel', onPressed: onCancel),
              ],
            )
            
          ],  
      )
    ));
  }
}