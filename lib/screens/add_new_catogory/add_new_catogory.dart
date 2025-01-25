import 'package:event_vault/costum_widgets/add_menu_btn/add_menu_btn.dart';
import 'package:event_vault/costum_widgets/app_bar/app_bar.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/costum_widgets/text_field/text_field.dart';
import 'package:event_vault/database/functions/add_catogory/add_catogory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:event_vault/database/modals/catogory_model/catogory_model.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final TextEditingController categoryNameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.mainBg,
      appBar: CustomAppBar(title: 'Add New Category'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              myField(
                  hint: 'Enter Category Name',
                  fieldTitle: 'Category Name',
                  validator: (p0) {
                    return null;
                  },
                  controller: categoryNameCtrl),
              
              SizedBox(height: 20),
              addMenuBtn(
                btnText: 'Save Category',
                onPressed: () async {
                  final categoryName = categoryNameCtrl.text;
                  if (categoryName.isNotEmpty) {
                    final newCategory = CatogoryModel(
                      name: categoryName,
                      catogoryId:
                          DateTime.now().millisecondsSinceEpoch.toString(),
                    );
                    addCategory(newCategory);
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
