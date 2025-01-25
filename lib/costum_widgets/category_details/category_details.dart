import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget categoryDetails(
    {required String categoryName, required String categoryDiscription}) {
  return Column(
    children: [
      SizedBox(
        height: 100,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Category Name',
                  style: GoogleFonts.roboto(
                    color: ColorPalette.textW,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Card(
              color: ColorPalette.secondary,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          categoryName,
                          style: GoogleFonts.roboto(
                            color: ColorPalette.textW,
                            fontWeight: FontWeight.w800,
                            fontSize: 17,
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
      SizedBox(
        height: 100,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Discription',
                  style: GoogleFonts.roboto(
                    color: ColorPalette.textW,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Card(
              color: ColorPalette.secondary,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          categoryDiscription,
                          style: GoogleFonts.roboto(
                            color: ColorPalette.textW,
                            fontWeight: FontWeight.w800,
                            fontSize: 17,
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    ],
  );
}
