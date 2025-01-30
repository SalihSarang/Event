import 'package:event_vault/costum_widgets/add_menu_btn/add_menu_btn.dart';
import 'package:event_vault/costum_widgets/app_bar/app_bar.dart';
import 'package:event_vault/costum_widgets/custom_listenable_builder/build_item_list/build_item_list.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/costum_widgets/text_field/text_field.dart';
import 'package:event_vault/costum_widgets/unique_id/unique_id.dart';
import 'package:event_vault/database/functions/add_items/add_items.dart';
import 'package:event_vault/database/modals/item_model/item_model.dart';
import 'package:event_vault/form_validation/category_details/category_item/item_name/category_item.dart';
import 'package:event_vault/form_validation/category_details/category_item/item_price/item_price.dart';
import 'package:flutter/material.dart';

class AddCategoryItems extends StatefulWidget {
  String categoryId;

  AddCategoryItems({super.key, required this.categoryId});

  @override
  State<AddCategoryItems> createState() => _AddCategoryItemsState();
}

final itemName = TextEditingController();
final price = TextEditingController();

class _AddCategoryItemsState extends State<AddCategoryItems> {
  @override
  void initState() {
    super.initState();
    getItems();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print('Category Id : ${widget.categoryId}');

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
            Navigator.pop(context);
            itemName.clear();
            price.clear();
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
                    myField(validationMode: AutovalidateMode.onUserInteraction,
                      hint: 'Enter Item Name',
                      fieldTitle: 'Item Name',
                      validator: (value) => categoryItemNameValidation(value),
                      controller: itemName,
                    ),
                    const SizedBox(height: 20),
                    myField(validationMode: AutovalidateMode.onUserInteraction,
                        hint: 'Enter Price',
                        fieldTitle: 'Price',
                        validator: (value) => itemPriceValidation(value),
                        controller: price),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              addMenuBtn(
                btnText: 'Add Item',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final items = ItemModel(
                        itemName: itemName.text,
                        itemPrice: price.text,
                        itemId: generateID(),
                        catogoryId: widget.categoryId);
                    addItems(items);
                    itemName.clear();
                    price.clear();
                  }
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: buildItemsList(
                      itemListener: itemListener,
                      categoryId: widget.categoryId,
                      context: context),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
