import 'package:event_vault/costum_widgets/add_menu_btn/add_menu_btn.dart';
import 'package:event_vault/costum_widgets/app_bar/app_bar.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/costum_widgets/fiter_chips/fiter_chips.dart';
import 'package:event_vault/costum_widgets/save_add_btn/save_add_btn.dart';
import 'package:event_vault/costum_widgets/text_field/text_field.dart';
import 'package:event_vault/database/functions/add_items/add_items.dart';
import 'package:event_vault/database/modals/item_model/item_model.dart';
import 'package:event_vault/screens/add_catogory_menu/add_new_item.dart';
import 'package:flutter/material.dart';

class AddCategoryMenu extends StatelessWidget {
  const AddCategoryMenu({super.key});
  @override
  Widget build(BuildContext context) {
    final budgetCtrl = TextEditingController();

    return Scaffold(
      backgroundColor: ColorPalette.mainBg,
      appBar: CustomAppBar(title: 'Add Catering Menu'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              myField(
                  hint: 'Enter Budget',
                  fieldTitle: 'Budget',
                  validator: (p0) {
                    return null;
                  },
                  controller: budgetCtrl),
             
              SizedBox(
                height: 20,
              ),
              ValueListenableBuilder<List<ItemModel>>(
                valueListenable: itemListener,
                builder: (context, value, child) {
                  return MenuChip(
                    chipItems: value.map((item) => item.itemName).toList(),
                    manuTitle: 'Select food menu',
                  );
                },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
