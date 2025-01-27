import 'package:event_vault/costum_widgets/app_bar/app_bar.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/costum_widgets/custom_listenable_builder/build_item_list/build_item_list.dart';
import 'package:event_vault/costum_widgets/save_add_btn/save_add_btn.dart';
import 'package:event_vault/costum_widgets/text_field/text_field.dart';
import 'package:event_vault/database/functions/add_items/add_items.dart';
import 'package:flutter/material.dart';

class AddNewItem extends StatelessWidget {
  String categoryId;
  AddNewItem({super.key, required this.categoryId});

  final itemNameCtrl = TextEditingController();
  final priceCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.mainBg,
      appBar: CustomAppBar(title: 'Add New Menu Item'),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            myField(
                hint: 'Enter Item Name',
                fieldTitle: 'Item Name',
                validator: (p0) {
                  return null;
                },
                controller: itemNameCtrl),
            SizedBox(
              height: 20,
            ),
            myField(
                hint: 'Enter Price',
                fieldTitle: 'Price',
                validator: (value) {
                  return null;
                },
                controller: priceCtrl),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: buildItemsList(
                  itemListener: itemListener,
                  categoryId: categoryId,
                  context: context),
            ),
            saveCancelRow(
              context: context,
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
