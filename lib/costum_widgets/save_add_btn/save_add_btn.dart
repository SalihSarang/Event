import 'package:event_vault/costum_widgets/alert_box/alert_box.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/screens/category_screen/select_category/selecting_catogory.dart';
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
    required VoidCallback addItemButton,
    required VoidCallback updateButton,
    required VoidCallback detailsBtn}) {
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
                  PopupMenuButton<String>(
                    color: const Color.fromARGB(255, 60, 63, 100),
                    onSelected: (value) {
                      switch (value) {
                        case 'Option 1':
                          addItemButton();
                          break;
                        case 'Option 2':
                          updateButton();
                          break;
                        case 'Option 3':
                          deleteBtn();
                          break;
                        case 'Option 4':
                          detailsBtn();
                          break;
                      }
                      print('You selected: $value');
                    },
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        value: 'Option 1',
                        child: TextButton(
                            onPressed: addItemButton,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: ColorPalette.textW,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Add Item',
                                  style: GoogleFonts.roboto(
                                    color: ColorPalette.textW,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      PopupMenuItem(
                        value: 'Option 4',
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: detailsBtn,
                              icon: Icon(
                                Icons.article_outlined,
                                color: ColorPalette.textW,
                                size: 25,
                              ),
                            ),
                            Text(
                              'Details',
                              style: GoogleFonts.roboto(
                                color: ColorPalette.textW,
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'Option 2',
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: updateButton,
                                icon: Icon(
                                  Icons.edit,
                                  color: ColorPalette.hilite,
                                  size: 25,
                                )),
                            Text(
                              'Edit',
                              style: GoogleFonts.roboto(
                                color: ColorPalette.textW,
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'Option 3',
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: deleteBtn,
                              icon: Icon(
                                Icons.delete,
                                color: ColorPalette.delete,
                                size: 25,
                              ),
                            ),
                            Text(
                              'Delete',
                              style: GoogleFonts.roboto(
                                color: ColorPalette.textW,
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                    child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.more_vert,
                        color: ColorPalette.textW,
                        size: 25,
                      ),
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
