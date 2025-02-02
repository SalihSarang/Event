import 'package:event_vault/database/modals/catogory_model/catogory_model.dart';
import 'package:event_vault/screens/add_event_screens/add_event/add_event.dart';
import 'package:event_vault/screens/category_screen/add_item/add_category_items.dart';
import 'package:event_vault/screens/category_screen/category_details/category_details.dart';
import 'package:event_vault/screens/category_screen/edit_category/edit_category.dart';
import 'package:event_vault/widgets/alert_box/alert_box.dart';
import 'package:event_vault/widgets/save_add_btn/save_add_btn.dart';
import 'package:flutter/material.dart';

Widget buildCategoryListView({
  required ValueNotifier<List<CatogoryModel>> catogoryListener,
  required Function(String catogoryId) deleteCategory,
}) {
  return ValueListenableBuilder<List<CatogoryModel>>(
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
                customAlertBox(
                  context,
                  icon: Icons.delete,
                  message: 'You want to delete this category',
                  noPressed: () {
                    Navigator.pop(context);
                  },
                  yesPressed: () {
                    Navigator.pop(context);
                    deleteCategory(category.catogoryId);
                  },
                  title: 'Delete this category',
                );
              },
              titleBtn: category.name,
              onBtn: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ScreenAddEvent(
                    selectedCatogory: category.catogoryId,
                    categoryName: category.name,
                  ),
                ));
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
  );
}
