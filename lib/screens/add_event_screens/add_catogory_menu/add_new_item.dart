import 'package:event_vault/costum_widgets/app_bar/app_bar.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/costum_widgets/custom_listenable_builder/build_item_list/build_item_list.dart';
import 'package:event_vault/costum_widgets/save_add_btn/save_add_btn.dart';
import 'package:event_vault/costum_widgets/text_field/text_field.dart';
import 'package:event_vault/costum_widgets/unique_id/unique_id.dart';
import 'package:event_vault/database/functions/add_items/add_items.dart';
import 'package:event_vault/database/modals/item_model/item_model.dart';
import 'package:event_vault/form_validation/category_details/category_item/item_name/category_item.dart';
import 'package:event_vault/form_validation/category_details/category_item/item_price/item_price.dart';
import 'package:flutter/material.dart';

class AddNewItem extends StatelessWidget {
  String categoryId;
  AddNewItem({super.key, required this.categoryId});

  final itemNameCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    getItems();
    print(categoryId);
    return Scaffold(
      backgroundColor: ColorPalette.mainBg,
      appBar: CustomAppBar(title: 'Add New Menu Item'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Form(
                key: keyform,
                child: myField(
                  validationMode: AutovalidateMode.onUserInteraction,
                  hint: 'Enter Item Name',
                  fieldTitle: 'Item Name',
                  validator: (value) => categoryItemNameValidation(value),
                  controller: itemNameCtrl,
                ),
              ),
              SizedBox(height: 20),
              myField(
                validationMode: AutovalidateMode.onUserInteraction,
                hint: 'Enter Price',
                fieldTitle: 'Price',
                validator: (value) => itemPriceValidation(value),
                controller: priceCtrl,
              ),
              SizedBox(height: 20),
              Expanded(
                child: buildItemsList(
                  itemListener: itemListener,
                  categoryId: categoryId,
                  context: context,
                ),
              ),
              saveCancelRow(
                context: context,
                rightBtn: 'Save',
                leftBtn: 'Cancel',
                onRightBtn: () {
                  if (keyform.currentState!.validate()) {
                    final items = ItemModel(
                      itemName: itemNameCtrl.text,
                      itemPrice: priceCtrl.text,
                      itemId: generateID(),
                      catogoryId: categoryId,
                    );
                    addItems(items);
                    itemNameCtrl.clear();
                    priceCtrl.clear();
                  }
                },
                onleftBtn: () {
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
