import 'package:event_vault/widgets/color%20palette/color_palette.dart';
import 'package:flutter/material.dart';

Widget dropDown(
    {required List<String> dropDownList,
    required String selectedTextFieldItem,
    required Function(String?) onChanged}) {
  return DropdownButtonFormField<String>(
    value: selectedTextFieldItem,
    decoration: InputDecoration(
      filled: true,
      fillColor: ColorPalette.secondary,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: ColorPalette.secondary,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: ColorPalette.secondary,
          width: 2,
        ),
      ),
    ),
    dropdownColor: ColorPalette.secondary,
    items: dropDownList.map((String item) {
      return DropdownMenuItem<String>(
        value: item,
        child: Text(
          item,
          style: TextStyle(color: ColorPalette.textW),
        ),
      );
    }).toList(),
    onChanged: onChanged,
  );
}
