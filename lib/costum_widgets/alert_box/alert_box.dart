// Function to show a custom alert dialog
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void customAlertBox(
  BuildContext context, {
  required String title,
  required String message,
  required IconData icon,
  required VoidCallback noPressed,
  required VoidCallback yesPressed,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: ColorPalette.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Center(
                    child: Icon(
                      icon,
                      color: ColorPalette.delete,
                      size: 50,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    message,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      color: ColorPalette.textW,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: noPressed,
                    child: Row(
                      children: [
                        Text(
                          'No',
                          style: GoogleFonts.roboto(
                            color: ColorPalette.textW,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: yesPressed,
                    child: Row(
                      children: [
                        Text(
                          'Yes',
                          style: GoogleFonts.roboto(
                            color: ColorPalette.textW,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
