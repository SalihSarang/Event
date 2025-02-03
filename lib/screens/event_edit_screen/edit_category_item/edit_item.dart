import 'package:event_vault/database/functions/add_items/add_items.dart';
import 'package:event_vault/database/modals/item_model/item_model.dart';
import 'package:event_vault/utils/validation/category_details/category_item/item_name/category_item.dart';
import 'package:event_vault/utils/validation/category_details/category_item/item_price/item_price.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/color%20palette/color_palette.dart';
import 'package:event_vault/widgets/custom_listenable_builder/build_item_list/build_item_list.dart';
import 'package:event_vault/widgets/save_add_btn/save_add_btn.dart';
import 'package:event_vault/widgets/text_field/text_field.dart';
import 'package:event_vault/widgets/unique_id/unique_id.dart';
import 'package:flutter/material.dart';

class EditItem extends StatefulWidget {
  String categoryId;
  EditItem({super.key, required this.categoryId});

  @override
  State<EditItem> createState() => _EditItem();
}

class _EditItem extends State<EditItem> {
  final itemNameCtrl = TextEditingController();

  final priceCtrl = TextEditingController();

  final keyform = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      getItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.categoryId);
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
                  categoryId: widget.categoryId,
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
                      catogoryId: widget.categoryId,
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
