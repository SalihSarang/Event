import 'package:event_vault/costum_widgets/alert_box/alert_box.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/database/functions/add_items/add_items.dart';
import 'package:event_vault/database/modals/item_model/item_model.dart';
import 'package:event_vault/screens/category_screen/item_edit/item_edit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildItemsList({
  required ValueListenable<List<ItemModel>> itemListener,
  required String categoryId,
  required BuildContext context,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 7, bottom: 10),
        child: Text(
          'Items',
          style: GoogleFonts.roboto(
            color: ColorPalette.textW,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ),
      ValueListenableBuilder<List<ItemModel>>(
        valueListenable: itemListener,
        builder: (context, items, child) {
          final filteredItems =
              items.where((item) => item.catogoryId == categoryId).toList();

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
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return Card(
                  color: ColorPalette.secondary,
                  child: ListTile(
                      title: Text(
                        '${item.itemName}',
                        style: GoogleFonts.roboto(
                          color: ColorPalette.textW,
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
                      ),
                      subtitle: Text(
                        'Price : ${item.itemPrice}',
                        style: GoogleFonts.roboto(
                          color: ColorPalette.textW,
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: ColorPalette.hilite,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ItemEdit(
                                  categoryID: item.catogoryId,
                                  itemID: item.itemId,
                                  itemName: item.itemName,
                                  itemPrice: item.itemPrice,
                                ),
                              ));
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: ColorPalette.delete,
                              size: 30,
                            ),
                            onPressed: () {
                              customAlertBox(
                                context,
                                title: 'You want to delete this item',
                                message: 'You want to delete this item',
                                icon: Icons.delete,
                                noPressed: () {
                                  Navigator.of(context).pop();
                                },
                                yesPressed: () {
                                  Navigator.of(context).pop();
                                  deleteItem(item.itemId);
                                },
                              );
                            },
                          ),
                        ],
                      )),
                );
              },
            ),
          );
        },
      ),
    ],
  );
}
