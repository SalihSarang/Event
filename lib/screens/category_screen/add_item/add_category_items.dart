import 'package:event_vault/costum_widgets/add_menu_btn/add_menu_btn.dart';
import 'package:event_vault/costum_widgets/app_bar/app_bar.dart';
import 'package:event_vault/costum_widgets/build_item_list/build_item_list.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/costum_widgets/text_field/text_field.dart';
import 'package:event_vault/costum_widgets/unique_id/unique_id.dart';
import 'package:event_vault/database/functions/add_items/add_items.dart';
import 'package:event_vault/database/modals/item_model/item_model.dart';
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
              myField(
                hint: 'Enter Item Name',
                fieldTitle: 'Item Name',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Item Name cannot be empty.';
                  }
                  if (value.trim().length < 3) {
                    return 'Item Name must be at least 3 characters long.';
                  }
                  if (value.trim().length > 50) {
                    return 'Item Name cannot exceed 50 characters.';
                  }
                  return null;
                },
                controller: itemName,
              ),
              const SizedBox(height: 20),
              myField(
                  hint: 'Enter Price',
                  fieldTitle: 'Price',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Item price cannot be empty.';
                    }

                    if (value.trim().length > 7) {
                      return 'Item Name cannot exceed 7 characters.';
                    }
                    return null;
                  },
                  controller: price),
              const SizedBox(height: 20),
              addMenuBtn(
                btnText: 'Add Item',
                onPressed: () {
                  final items = ItemModel(
                      itemName: itemName.text,
                      itemPrice: price.text,
                      itemId: generateID(),
                      catogoryId: widget.categoryId);
                  addItems(items);
                },
              ),
              Expanded(
                child: buildItemsList(
                    itemListener: itemListener,
                    categoryId: widget.categoryId,
                    context: context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
