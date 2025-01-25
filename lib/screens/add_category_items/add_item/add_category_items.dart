import 'package:event_vault/costum_widgets/add_menu_btn/add_menu_btn.dart';
import 'package:event_vault/costum_widgets/app_bar/app_bar.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/costum_widgets/text_field/text_field.dart';
import 'package:event_vault/database/functions/add_items/add_items.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          onPressed: () {},
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
                    return null;
                  },
                  controller: itemName),
              const SizedBox(height: 20),
              myField(
                  hint: 'Enter Price',
                  fieldTitle: 'Price',
                  validator: (value) {
                    return null;
                  },
                  controller: price),
              const SizedBox(height: 20),
              addMenuBtn(
                btnText: 'Add Item',
                onPressed: () {
                  // final items = ItemModel(
                  //   catogoryId:,itemId:  DateTime.now().millisecondsSinceEpoch.toString(),itemName:
                  // );
                },
              ),
              ValueListenableBuilder(
                valueListenable: itemListener,
                builder: (context, items, child) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];

                        return ListTile(
                          title: Text(
                            item.itemName,
                            style: GoogleFonts.roboto(
                              color: ColorPalette.delete,
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                          trailing: Text(
                            item.itemPrice,
                            style: GoogleFonts.roboto(
                              color: ColorPalette.delete,
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
