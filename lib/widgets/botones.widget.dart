import 'package:flutter/material.dart';

Widget drawButton(
    {required dynamic method,
    int valorFlex = 1,
    required Widget component,
    dynamic colorButton = Colors.white10}) {
  return Expanded(
      flex: valorFlex,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: colorButton,
              ),
              onPressed: method,
              child: component),
        ),
      ));
}
