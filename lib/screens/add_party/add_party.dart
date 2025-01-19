import 'package:event_vault/costum_widgets/save_add_btn.dart';
import 'package:event_vault/costum_widgets/text_field.dart';
import 'package:event_vault/screens/add_catering_menu/add_catering_menu.dart';
import 'package:event_vault/screens/add_decoration/add_decoration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPartyScreen extends StatelessWidget {
  AddPartyScreen({super.key});

  final partyTypeCtrl = TextEditingController();
  final guestCountCtrl = TextEditingController();
  final budgetCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 26, 37, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(25, 26, 37, 1),
        title: Center(
          child: Text(
            "Add Party",
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            myField(
                hint: 'Enter party type',
                fieldTitle: 'Enter party',
                validator: (p0) {},
                controller: partyTypeCtrl),
            SizedBox(
              height: 20,
            ),
            myField(
                hint: 'Enter Number Of Gusts',
                fieldTitle: 'Guest Count',
                validator: (p0) {},
                controller: guestCountCtrl),
            SizedBox(
              height: 20,
            ),
            myField(
                hint: 'Enter Budget',
                fieldTitle: 'Budget',
                validator: (p0) {},
                controller: budgetCtrl),
            SizedBox(
              height: 20,
            ),
            selectCatogory(
              titleBtn: 'Catering',
              onBtn: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddCateringMenu(),
                ));
              },
            ),
            SizedBox(
              height: 20,
            ),
            selectCatogory(
              titleBtn: 'Decoration',
              onBtn: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddDecorationMenu(),
                ));
              },
            ),
            SizedBox(
              height: 20,
            ),
            saveCancelRow(
              rightBtn: 'Save',
              leftBtn: 'Cancel',
              onRightBtn: () {},
              onleftBtn: () {},
            )
          ],
        ),
      )),
    );
  }
}
