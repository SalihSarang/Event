import 'package:event_vault/costum_widgets/app_bar/app_bar.dart';
import 'package:event_vault/costum_widgets/build_item_list/build_item_list.dart';
import 'package:event_vault/costum_widgets/category_details/category_details.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/database/functions/add_items/add_items.dart';
import 'package:flutter/material.dart';

class CategoryDetails extends StatefulWidget {
  final String categoryName;
  final String categoryDiscription;
  final String categoryId;

  CategoryDetails(
      {super.key,
      required this.categoryName,
      required this.categoryDiscription,
      required this.categoryId});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  void initState() {
    super.initState();
    getItems();
  }

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
                categoryName: widget.categoryName,
                categoryDiscription: widget.categoryDiscription,
              ),
              Expanded(
                child: buildItemsList(
                    itemListener: itemListener,
                    categoryId: widget.categoryId,
                    context: context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
