import 'dart:io';

import 'package:event_vault/costum_widgets/add_menu_btn.dart';
import 'package:event_vault/costum_widgets/fiter_chips.dart';
import 'package:event_vault/costum_widgets/save_add_btn.dart';
import 'package:event_vault/costum_widgets/text_field.dart';
import 'package:event_vault/screens/add_catering_menu/add_new_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCateringMenu extends StatelessWidget {
  AddCateringMenu({super.key});
  var chipList = [
    "Chiken Biriyanni",
    "Mutton Biriyanni",
    "Beef Biriyanni",
    "Chiken Curry",
    "Ghee Rice"
  ];

  @override
  Widget build(BuildContext context) {
    final budgetCtrl = TextEditingController();
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 26, 37, 1),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Add Catering Menu',
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
                hint: 'Enter Budgeconst t',
                fieldTitle: 'Budget',
                validator: (p0) {},
                controller: budgetCtrl),
            SizedBox(
              height: 20,
            ),
            MenuChip(
              chipItems: chipList,
              manuTitle: 'Select food menu',
            ),
            SizedBox(
              height: 20,
            ),
            addMenuBtn(
              btnText: 'Add Menu Item',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddNewItem(),
                ));
              },
            ),
            SizedBox(
              height: 20,
            ),
            myBigField(
                hint: 'Special Requirements',
                fieldTitle: "Enter Custom Requests"),
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
