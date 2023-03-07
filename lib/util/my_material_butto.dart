import 'package:flutter/material.dart';

class MyMaterialButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyMaterialButton({
    super.key,
    required this.text,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child:MaterialButton(
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
        child:Text(text))

    );
  }
}