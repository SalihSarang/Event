import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget addMenuBtn({required String btnText, required VoidCallback onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          width: 0,
        ),
      ),
      backgroundColor: AppTheme.hilite,
      minimumSize: Size(235, 60),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add,
          color: AppTheme.textW,
          size: 25,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          btnText,
          style: GoogleFonts.roboto(
            color: AppTheme.textW,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}
