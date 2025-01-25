import 'package:event_vault/costum_widgets/add_menu_btn/add_menu_btn.dart';
import 'package:event_vault/costum_widgets/app_bar/app_bar.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/costum_widgets/text_field/text_field.dart';
import 'package:event_vault/costum_widgets/unique_id/unique_id.dart';
import 'package:event_vault/database/functions/add_items/add_items.dart';
import 'package:event_vault/database/modals/item_model/item_model.dart';
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
  void initState() {
    // TODO: implement initState
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
                  // Check if the field is empty or null
                  if (value == null || value.trim().isEmpty) {
                    return 'Item Name cannot be empty.';
                  }
                  // Optional: Check for minimum length
                  if (value.trim().length < 3) {
                    return 'Item Name must be at least 3 characters long.';
                  }
                  // Optional: Check for maximum length
                  if (value.trim().length > 50) {
                    return 'Item Name cannot exceed 50 characters.';
                  }
                  return null; // Validation passed
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

                    // Optional: Check for maximum length
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
              ValueListenableBuilder(
                valueListenable: itemListener,
                builder: (context, items, child) {
                  final filteredItems = items
                      .where(
                        (item) => item.catogoryId == widget.categoryId,
                      )
                      .toList();
                  if (filteredItems.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'No items available in this category.',
                          style: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = filteredItems[index];
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
