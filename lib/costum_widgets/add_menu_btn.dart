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
      backgroundColor: const Color.fromRGBO(30, 92, 228, 1),
      minimumSize: Size(235, 60),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add,
          color: Colors.white,
          size: 25,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          btnText,
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}
