import 'package:event_vault/widgets/color%20palette/color_palette.dart';
import 'package:flutter/material.dart';

ThemeData timeTheme() {
  final timeTheme = ThemeData.light().copyWith(
      timePickerTheme: TimePickerThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          hourMinuteShape: const CircleBorder(),
          backgroundColor: ColorPalette.mainBg,
          hourMinuteColor: WidgetStateColor.resolveWith((states) =>
              states.contains(WidgetState.selected)
                  ? Color.fromARGB(255, 84, 89, 138).withValues(alpha: .5)
                  : ColorPalette.secondary),
          hourMinuteTextColor: WidgetStateColor.resolveWith((states) =>
              states.contains(WidgetState.selected)
                  ? ColorPalette.textW
                  : ColorPalette.textW),
          dialHandColor: ColorPalette.hilite,
          // ignore: deprecated_member_use
          dialBackgroundColor:
              Color.fromARGB(255, 84, 89, 138).withValues(alpha: .5),
          dialTextColor: WidgetStateColor.resolveWith((states) =>
              states.contains(WidgetState.selected)
                  ? ColorPalette.textW
                  : ColorPalette.hint),
          entryModeIconColor: ColorPalette.hilite),
      textTheme: TextTheme(
        labelSmall: TextStyle(
          color: Colors.red,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        backgroundColor: WidgetStateColor.resolveWith(
          (states) => Color.fromARGB(255, 84, 89, 138).withValues(alpha: .5),
        ),
        foregroundColor:
            WidgetStateColor.resolveWith((states) => ColorPalette.textW),
        overlayColor:
            WidgetStateColor.resolveWith((states) => ColorPalette.mainBg),
      )));
  return timeTheme;
}
