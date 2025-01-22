import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget settingsOptions({
  required Icon leadIcon,
  required String title,
  required String subTitle,
}) {
  return Stack(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Color.fromRGBO(32, 34, 54, 1),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: leadIcon,
          ),
          SizedBox(
            width: 25,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
                Text(
                  subTitle,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Positioned(
        right: 0,
        top: 20,
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white,
        ),
      ),
    ],
  );
}
