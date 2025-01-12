import 'package:flutter/material.dart';

Widget dropDown(
    {required List<String> dropDownList,
    required String selectedTextFieldItem,
    required Function(String?) onChanged}) {
  return DropdownButtonFormField<String>(
    value: selectedTextFieldItem,
    decoration: InputDecoration(
      filled: true,
      fillColor: const Color.fromRGBO(32, 34, 54, 1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: const Color.fromRGBO(32, 34, 54, 1),
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: const Color.fromRGBO(32, 34, 54, 1),
          width: 2,
        ),
      ),
    ),
    dropdownColor: const Color.fromRGBO(32, 34, 54, 1),
    items: dropDownList.map((String item) {
      
      return DropdownMenuItem<String>(
        value: item,
        child: Text(
          item,
          style: const TextStyle(color: Colors.white),
        ),
      );
    }).toList(),
    onChanged: onChanged,
  );
}
