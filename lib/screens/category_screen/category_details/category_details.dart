import 'package:event_vault/costum_widgets/app_bar/app_bar.dart';
import 'package:event_vault/costum_widgets/category_details/category_details.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/database/functions/add_items/add_items.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryDetails extends StatelessWidget {
  final String categoryName;
  final String categoryDiscription;
  final String categoryId;

  CategoryDetails(
      {super.key,
      required this.categoryName,
      required this.categoryDiscription,
      required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.mainBg,
      appBar: CustomAppBar(title: 'Category Details'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              categoryDetails(
                categoryName: categoryName,
                categoryDiscription: categoryDiscription,
              ),
              ValueListenableBuilder(
                valueListenable: itemListener,
                builder: (context, items, child) {
                  final filteredItems = items
                      .where(
                        (item) => item.catogoryId == categoryId,
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
                              color: ColorPalette.textW,
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                          trailing: Text(
                            item.itemPrice,
                            style: GoogleFonts.roboto(
                              color: ColorPalette.textW,
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
