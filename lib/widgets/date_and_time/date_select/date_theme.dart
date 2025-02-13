import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:developer' as developer;

Future<String> selectDate(BuildContext context) async {
  final String date;
  DateTime curentDate = DateTime.now();

  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: curentDate,
    lastDate: DateTime(2100),
    builder: (context, child) {
      return Theme(data: dateTheme(), child: child!);
    },
  );

  if (pickedDate != null) {
    developer.log(pickedDate.toString());
    date = DateFormat('yyyy-MMM-dd').format(pickedDate);
    developer.log(date);
  } else {
    date = 'No date selected';
  }

  return date;
}

ThemeData dateTheme() {
  final myDateTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      onPrimary: Color.fromARGB(255, 255, 255, 255),
      onSurface: AppTheme.textW,
      primary: AppTheme.hilite,
    ),
    dialogBackgroundColor: AppTheme.mainBg,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppTheme.textW,
        textStyle: const TextStyle(
          color: AppTheme.textW,
          fontWeight: FontWeight.normal,
          fontSize: 12,
          fontFamily: 'Quicksand',
        ),
        backgroundColor: AppTheme.secondary,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: AppTheme.secondary,
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
