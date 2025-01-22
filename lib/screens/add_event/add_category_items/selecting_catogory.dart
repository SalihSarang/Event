import 'package:event_vault/costum_widgets/add_menu_btn.dart';
import 'package:event_vault/costum_widgets/save_add_btn.dart';
import 'package:event_vault/database/functions/add_catogory/add_catogory.dart';
import 'package:event_vault/screens/add_event/add_category_items/add_category_items.dart';
import 'package:event_vault/screens/add_new_catogory/add_new_catogory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      backgroundColor: const Color.fromRGBO(25, 26, 37, 1),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Select Category',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(25, 26, 37, 1),
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
      ),
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
                          addItemButton: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddCategoryItems(),
                            ));
                          },
                          deleteBtn: () {},
                          titleBtn: category.name,
                          onBtn: () {},
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
