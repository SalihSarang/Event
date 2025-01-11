import 'package:flutter/material.dart';

Widget myField(String label, double borderRadius, double borderWidth) {
  return TextFormField(
    decoration: InputDecoration(
      hintText: label,
      hintStyle: TextStyle(color: Color.fromRGBO(152, 152, 159, 1)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(
          color: Color.fromRGBO(32, 34, 54, 1),
          width: borderWidth,
        ),
      ),
    ),
  );
}
