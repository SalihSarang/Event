import 'package:event_vault/costum_widgets/add_menu_btn/add_menu_btn.dart';
import 'package:event_vault/costum_widgets/alert_box/alert_box.dart';
import 'package:event_vault/costum_widgets/app_bar/app_bar.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/costum_widgets/save_add_btn/save_add_btn.dart';
import 'package:event_vault/database/functions/add_catogory/add_catogory.dart';
import 'package:event_vault/screens/category_screen/add_item/add_category_items.dart';
import 'package:event_vault/screens/add_event_screens/add_event/add_event.dart';
import 'package:event_vault/screens/category_screen/add_new_catogory/add_new_catogory.dart';
import 'package:event_vault/screens/category_screen/category_details/category_details.dart';
import 'package:event_vault/screens/category_screen/edit_category/edit_category.dart';
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
              ValueListenableBuilder(
                valueListenable: catogoryListener,
                builder: (context, categories, child) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return selectCatogory(
                          detailsBtn: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CategoryDetails(
                                categoryDiscription: category.description,
                                categoryName: category.name,
                                categoryId: category.catogoryId,
                              ),
                            ));
                          },
                          addItemButton: () {
                            print('Category Id : ${category.catogoryId}');
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddCategoryItems(
                                categoryId: category.catogoryId,
                              ),
                            ));
                          },
                          deleteBtn: () {
                            customAlertBox(context,
                                icon: Icons.delete,
                                message: 'You want to delete this category',
                                noPressed: () {
                              Navigator.pop(context);
                            }, yesPressed: () {
                              Navigator.pop(context);
                              deleteCategory(category.catogoryId);
                            }, title: 'Delete this category');
                          },
                          titleBtn: category.name,
                          onBtn: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ScreenAddEvent(
                                    selectedCatogory: category.catogoryId)));
                          },
                          updateButton: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditCategory(
                                catecoryName: category.name,
                                discription: category.description,
                                categoryId: category.catogoryId,
                              ),
                            ));
                          },
                        );
                      },
                    ),
                  );
                },
              ),
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
