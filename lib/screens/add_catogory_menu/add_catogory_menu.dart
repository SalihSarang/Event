import 'package:event_vault/costum_widgets/add_menu_btn.dart';
import 'package:event_vault/costum_widgets/fiter_chips.dart';
import 'package:event_vault/costum_widgets/save_add_btn.dart';
import 'package:event_vault/costum_widgets/text_field.dart';
import 'package:event_vault/database/modals/catogory_model/catogory_model.dart';
import 'package:event_vault/database/modals/item_model/item_model.dart';
import 'package:event_vault/screens/add_catogory_menu/add_new_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class AddCateringMenu extends StatelessWidget {
  AddCateringMenu({super.key});

  final ValueNotifier<List<ItemModel>> selectedCategoryItems =
      ValueNotifier<List<ItemModel>>([]);
  final ValueNotifier<List<CatogoryModel>> categories =
      ValueNotifier<List<CatogoryModel>>([]);

  @override
  Widget build(BuildContext context) {
    final budgetCtrl = TextEditingController();

    // Fetch categories from the database
    _fetchCategories();

    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 26, 37, 1),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Add Catering Menu',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(25, 26, 37, 1),
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              myField(
                  hint: 'Enter Budget',
                  fieldTitle: 'Budget',
                  validator: (p0) {},
                  controller: budgetCtrl),
              SizedBox(
                height: 20,
              ),
              ValueListenableBuilder<List<CatogoryModel>>(
                valueListenable: categories,
                builder: (context, categoryList, child) {
                  return DropdownButton<String>(
                    hint: Text('Select Category',
                        style: TextStyle(color: Colors.white)),
                    dropdownColor: Color.fromRGBO(32, 34, 54, 1),
                    icon: Icon(Icons.arrow_downward, color: Colors.white),
                    iconSize: 24,
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    style: TextStyle(color: Colors.white),
                    items: categoryList.map((CatogoryModel category) {
                      return DropdownMenuItem<String>(
                        value: category.name,
                        child: Text(category.name),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        _fetchItemsForCategory(newValue);
                      }
                    },
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              ValueListenableBuilder<List<ItemModel>>(
                valueListenable: selectedCategoryItems,
                builder: (context, value, child) {
                  return MenuChip(
                    chipItems: value.map((item) => item.itemName).toList(),
                    manuTitle: 'Select food menu',
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              addMenuBtn(
                btnText: 'Add Menu Item',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddNewItem(),
                  ));
                },
              ),
              SizedBox(
                height: 20,
              ),
              myBigField(
                  hint: 'Special Requirements',
                  fieldTitle: "Enter Custom Requests"),
              SizedBox(
                height: 20,
              ),
              saveCancelColumn(
                downBtn: 'Save',
                upBtn: 'Cancel',
                onDownBtn: () {},
                onUpBtn: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _fetchCategories() async {
    final box = await Hive.openBox<CatogoryModel>('catogories');
    categories.value = box.values.toList();
  }

  void _fetchItemsForCategory(String categoryName) async {
    final box = await Hive.openBox<ItemModel>('items');
    final categoryBox = await Hive.openBox<CatogoryModel>('catogories');
    final category =
        categoryBox.values.firstWhere((cat) => cat.name == categoryName);
    selectedCategoryItems.value = box.values
        .where((item) => item.catogoryId == category.catogoryId)
        .toList();
  }
}
