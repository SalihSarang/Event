import 'package:event_vault/costum_widgets/add_menu_btn/add_menu_btn.dart';
import 'package:event_vault/costum_widgets/app_bar/app_bar.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/costum_widgets/text_field/text_field.dart';
import 'package:event_vault/database/functions/add_items/add_items.dart';
import 'package:event_vault/database/modals/item_model/item_model.dart';
import 'package:event_vault/form_validation/category_details/category_item/item_name/category_item.dart';
import 'package:event_vault/form_validation/category_details/category_item/item_price/item_price.dart';
import 'package:flutter/material.dart';

class ItemEdit extends StatefulWidget {
  String itemID;
  String itemName;
  String itemPrice;
  String categoryID;

  ItemEdit(
      {super.key,
      required this.itemID,
      required this.categoryID,
      required this.itemName,
      required this.itemPrice});

  @override
  State<ItemEdit> createState() => _AddCategoryItemsState();
}

final itemName = TextEditingController();
final price = TextEditingController();
final formKey = GlobalKey<FormState>();

class _AddCategoryItemsState extends State<ItemEdit> {
  @override
  Widget build(BuildContext context) {
    itemName.text = widget.itemName;
    price.text = widget.itemPrice;
    return Scaffold(
      backgroundColor: ColorPalette.mainBg,
      appBar: CustomAppBar(
        title: 'Add Category Item',
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: addMenuBtn(
          btnText: 'Save',
          onPressed: () {
            if (formKey.currentState!.validate()) {
              final items = ItemModel(
                  itemName: itemName.text,
                  itemPrice: price.text,
                  itemId: widget.itemID,
                  catogoryId: widget.categoryID);
              addItems(items);
              Navigator.pop(context);
              itemName.clear();
              price.clear();
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    myField(
                      hint: 'Enter Item Name',
                      fieldTitle: 'Item Name',
                      validator: (value) => categoryItemNameValidation(value),
                      controller: itemName,
                    ),
                    const SizedBox(height: 20),
                    myField(
                        hint: 'Enter Price',
                        fieldTitle: 'Price',
                        validator: (value) => itemPriceValidation(value),
                        controller: price),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
