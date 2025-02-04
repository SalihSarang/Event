import 'dart:io';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget imgAddField({
  required String buttonTitle,
  required Icon myIcon,
  required VoidCallback onPressed,
  String? imagePicked,
}) {
  return Column(
    children: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: AppTheme.hint,
                width: 1,
              ),
            ),
            backgroundColor: AppTheme.secondary,
            minimumSize: Size(double.infinity, 60),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera_alt_outlined,
                color: AppTheme.textW,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                buttonTitle,
                style: GoogleFonts.roboto(
                  color: AppTheme.textW,
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
                    image: FileImage(File(imagePicked)),
                  ),
            color: AppTheme.secondary,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              width: 1,
              color: AppTheme.hint,
            )),
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}
