import 'package:event_vault/costum_widgets/add_menu_btn/add_menu_btn.dart';
import 'package:event_vault/costum_widgets/app_bar/app_bar.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/costum_widgets/text_field/text_field.dart';
import 'package:event_vault/database/functions/add_catogory/add_catogory.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:event_vault/database/modals/catogory_model/catogory_model.dart';

class EditCategory extends StatefulWidget {
  String catecoryName;
  String discription;
  String categoryId;
  EditCategory(
      {super.key,
      required this.catecoryName,
      required this.discription,
      required this.categoryId});

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<EditCategory> {
  final TextEditingController categoryNameCtrl = TextEditingController();
  final TextEditingController descriptionCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    categoryNameCtrl.text = widget.catecoryName;
    descriptionCtrl.text = widget.discription;

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
              myBigField(
                  hint: 'Description',
                  fieldTitle: 'Description',
                  controller: descriptionCtrl),
              SizedBox(height: 20),
              addMenuBtn(
                btnText: 'Save Category',
                onPressed: () async {
                  if (categoryNameCtrl.text.isNotEmpty &&
                      descriptionCtrl.text.isNotEmpty) {
                    final newCategory = CatogoryModel(
                      name: categoryNameCtrl.text,
                      catogoryId: widget.categoryId,
                      description: descriptionCtrl.text,
                    );

                    upDateCategprys(newCategory);
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
