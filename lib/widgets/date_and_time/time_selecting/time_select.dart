import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

ThemeData timeTheme() {
  final timeTheme = ThemeData.light().copyWith(
      timePickerTheme: TimePickerThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          hourMinuteShape: const CircleBorder(),
          backgroundColor: AppTheme.mainBg,
          hourMinuteColor: WidgetStateColor.resolveWith((states) =>
              states.contains(WidgetState.selected)
                  ? Color.fromARGB(255, 84, 89, 138).withValues(alpha: .5)
                  : AppTheme.secondary),
          hourMinuteTextColor: WidgetStateColor.resolveWith((states) =>
              states.contains(WidgetState.selected)
                  ? AppTheme.textW
                  : AppTheme.textW),
          dialHandColor: AppTheme.hilite,
          // ignore: deprecated_member_use
          dialBackgroundColor:
              Color.fromARGB(255, 84, 89, 138).withValues(alpha: .5),
          dialTextColor: WidgetStateColor.resolveWith((states) =>
              states.contains(WidgetState.selected)
                  ? AppTheme.textW
                  : AppTheme.hint),
          entryModeIconColor: AppTheme.hilite),
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
            WidgetStateColor.resolveWith((states) => AppTheme.textW),
        overlayColor: WidgetStateColor.resolveWith((states) => AppTheme.mainBg),
      )));
  return timeTheme;
}
