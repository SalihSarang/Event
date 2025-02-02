import 'dart:io';
import 'package:event_vault/widgets/color%20palette/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

Widget imgAddField({
  required String buttonTitle,
  required Icon myIcon,
  required VoidCallback onPressed,
  XFile? imagePicked,
}) {
  return Column(
    children: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: ColorPalette.hint,
                width: 1,
              ),
            ),
            backgroundColor: ColorPalette.secondary,
            minimumSize: Size(double.infinity, 60),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera_alt_outlined,
                color: ColorPalette.textW,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                buttonTitle,
                style: GoogleFonts.roboto(
                  color: ColorPalette.textW,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              )
            ],
          )),
      SizedBox(
        height: 10,
      ),
      Container(
        height: 200,
        decoration: BoxDecoration(
            image: imagePicked == null
                ? null
                : DecorationImage(
                    image: FileImage(File(imagePicked.path)),
                  ),
            color: ColorPalette.secondary,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              width: 1,
              color: ColorPalette.hint,
            )),
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}
