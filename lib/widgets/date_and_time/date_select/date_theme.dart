import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:developer' as developer;

Future<String> selectDate(BuildContext context) async {
  final String date;

  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2100),
    builder: (context, child) {
      return Theme(data: dateTheme(), child: child!);
    },
  );

  if (pickedDate != null) {
    developer.log("Picked Date: ${pickedDate.toIso8601String()}");
    DateTime validDate = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
    );
    date = DateFormat('dd/MMM/yyyy').format(validDate);
    developer.log("Formatted Date: $date");
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
    dialogTheme: DialogThemeData(backgroundColor: AppTheme.mainBg),
  );

  return myDateTheme;
}
