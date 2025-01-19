import 'package:event_vault/costum_widgets/save_add_btn.dart';
import 'package:event_vault/costum_widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDecorationItem extends StatelessWidget {
  AddDecorationItem({super.key});

  final itemNameCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final decorationCtrl = TextEditingController();
  final quantityCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 26, 37, 1),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Add New Menu Item',
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
        child: Column(
          children: [
            myField(
                hint: 'Enter Decoration Item',
                fieldTitle: 'Decoration Item Name',
                validator: (p0) {},
                controller: decorationCtrl),
            SizedBox(
              height: 20,
            ),
            myField(
                hint: 'Enter Quantity/Size',
                fieldTitle: 'Quantity/Size',
                validator: (p0) {},
                controller: quantityCtrl),
            SizedBox(
              height: 20,
            ),
            myField(
                hint: 'Enter Price',
                fieldTitle: 'Price',
                validator: (p0) {},
                controller: priceCtrl),
            SizedBox(
              height: 20,
            ),
            saveCancelRow(
              rightBtn: 'Save',
              leftBtn: 'Cancel',
              onRightBtn: () {},
              onleftBtn: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      )),
    );
  }
}
