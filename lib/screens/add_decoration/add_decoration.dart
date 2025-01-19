import 'dart:io';

import 'package:event_vault/costum_widgets/add_menu_btn.dart';
import 'package:event_vault/costum_widgets/fiter_chips.dart';
import 'package:event_vault/costum_widgets/save_add_btn.dart';
import 'package:event_vault/costum_widgets/text_field.dart';
import 'package:event_vault/screens/add_decoration/add_new_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDecorationMenu extends StatelessWidget {
  AddDecorationMenu({super.key});
  var chipList2 = [
    "Birth Day Banner",
    "Wedding Arch",
    "Halloween Punkin",
    "Ester Egs",
  ];

  @override
  Widget build(BuildContext context) {
    final budgetCtrl = TextEditingController();
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 26, 37, 1),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Add Decoration Menu',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(25, 26, 37, 1),
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            myField(
                hint: 'Enter Budget',
                fieldTitle: 'Budget',
                validator: (p0) {},
                controller: budgetCtrl),
            SizedBox(
              height: 20,
            ),
            MenuChip(
              chipItems: chipList2,
              manuTitle: 'Select food menu',
            ),
            SizedBox(
              height: 20,
            ),
            addMenuBtn(
              btnText: 'Add Menu Item',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddDecorationItem(),
                ));
              },
            ),
            SizedBox(
              height: 20,
            ),
            myBigField(
                hint: 'Enter specian requirements',
                fieldTitle: 'Specian Requirements'),
            SizedBox(
              height: 20,
            ),
            saveCancelColumn(
              downBtn: 'Save',
              upBtn: 'Cancel',
              onDownBtn: () {},
              onUpBtn: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      )),
    );
  }
}
