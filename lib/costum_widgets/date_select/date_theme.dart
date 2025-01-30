import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:flutter/material.dart';

ThemeData dateTheme() {
  final myDateTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      onPrimary: Color.fromARGB(255, 255, 255, 255), // selected text color
      onSurface: ColorPalette.textW, // default text color
      primary: ColorPalette.hilite, // circle color
    ),
    dialogBackgroundColor:
        ColorPalette.mainBg, // Background color of the dialog
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorPalette.textW,
        textStyle: const TextStyle(
          color: ColorPalette.textW,
          fontWeight: FontWeight.normal,
          fontSize: 12,
          fontFamily: 'Quicksand',
        ), // color of button's letters
        backgroundColor: ColorPalette.secondary, // Background color
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: ColorPalette.secondary,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ),
  );

  return myDateTheme;
}
