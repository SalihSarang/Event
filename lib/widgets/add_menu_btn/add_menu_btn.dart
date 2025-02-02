import 'package:event_vault/widgets/color%20palette/color_palette.dart';
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
      backgroundColor: ColorPalette.hilite,
      minimumSize: Size(235, 60),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add,
          color: ColorPalette.textW,
          size: 25,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          btnText,
          style: GoogleFonts.roboto(
            color: ColorPalette.textW,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}
