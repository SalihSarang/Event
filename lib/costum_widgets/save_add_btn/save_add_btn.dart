import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget saveCancelRow(
    {required String rightBtn,
    required String leftBtn,
    required VoidCallback onRightBtn,
    required VoidCallback onleftBtn}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: ColorPalette.hint,
                width: 0.1,
              ),
            ),
            backgroundColor: ColorPalette.secondary,
            minimumSize: Size(235, 60),
          ),
          onPressed: onleftBtn,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                leftBtn,
                style: GoogleFonts.roboto(
                  color: ColorPalette.textW,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              )
            ],
          )),
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                width: 0,
              ),
            ),
            backgroundColor: ColorPalette.secondary,
            minimumSize: Size(235, 60),
          ),
          onPressed: onRightBtn,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                rightBtn,
                style: GoogleFonts.roboto(
                  color: ColorPalette.textW,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              )
            ],
          )),
    ],
  );
}

Widget saveCancelColumn(
    {required String downBtn,
    required String upBtn,
    required VoidCallback onDownBtn,
    required VoidCallback onUpBtn}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: ColorPalette.hint,
                width: 0.1,
              ),
            ),
            backgroundColor: ColorPalette.secondary,
            minimumSize: Size(235, 60),
          ),
          onPressed: onUpBtn,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                upBtn,
                style: GoogleFonts.roboto(
                  color: ColorPalette.textW,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              )
            ],
          )),
      SizedBox(
        height: 15,
      ),
      ElevatedButton(
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
          onPressed: onDownBtn,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                downBtn,
                style: GoogleFonts.roboto(
                  color: ColorPalette.textW,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              )
            ],
          )),
    ],
  );
}

Widget selectCatogory(
    {required String titleBtn,
    required VoidCallback onBtn,
    required VoidCallback deleteBtn,
    required VoidCallback addItemButton}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: ColorPalette.hint,
                width: 0.1,
              ),
            ),
            backgroundColor: ColorPalette.secondary,
            minimumSize: Size(235, 60),
          ),
          onPressed: onBtn,
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                titleBtn,
                style: GoogleFonts.roboto(
                  color: ColorPalette.textW,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  TextButton(
                      onPressed: addItemButton,
                      child: Text(
                        'Add Item',
                        style: GoogleFonts.roboto(
                          color: ColorPalette.textW,
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                        ),
                      )),
                  IconButton(
                    onPressed: deleteBtn,
                    icon: Icon(
                      Icons.delete,
                      color: ColorPalette.delete,
                    ),
                  ),
                ],
              ),
            ],
          )),
      SizedBox(
        height: 20,
      )
    ],
  );
}
