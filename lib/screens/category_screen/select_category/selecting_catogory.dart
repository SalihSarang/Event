import 'package:event_vault/database/functions/add_catogory/add_catogory.dart';
import 'package:event_vault/screens/category_screen/add_new_catogory/add_new_catogory.dart';
import 'package:event_vault/widgets/add_menu_btn/add_menu_btn.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/color%20palette/color_palette.dart';
import 'package:event_vault/widgets/custom_listenable_builder/category_list_view/custom_listenable_builder.dart';
import 'package:flutter/material.dart';

class SelectingCategory extends StatefulWidget {
  const SelectingCategory({super.key});

  @override
  State<SelectingCategory> createState() => _SelectingCategoryState();
}

class _SelectingCategoryState extends State<SelectingCategory> {
  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.mainBg,
      appBar: CustomAppBar(title: 'Select Category'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              buildCategoryListView(
                  catogoryListener: catogoryListener,
                  deleteCategory: deleteCategory),
              const SizedBox(height: 10),
              addMenuBtn(
                btnText: 'Add New Category',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddCategoryScreen(),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
