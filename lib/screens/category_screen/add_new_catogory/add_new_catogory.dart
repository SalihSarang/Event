import 'package:event_vault/costum_widgets/add_menu_btn/add_menu_btn.dart';
import 'package:event_vault/costum_widgets/app_bar/app_bar.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/costum_widgets/text_field/text_field.dart';
import 'package:event_vault/database/functions/add_catogory/add_catogory.dart';
import 'package:event_vault/form_validation/category_details/category_name/category_name.dart';
import 'package:event_vault/form_validation/event_adding/event_discription/event_discription.dart';
import 'package:flutter/material.dart';
import 'package:event_vault/database/modals/catogory_model/catogory_model.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final TextEditingController categoryNameCtrl = TextEditingController();
  final TextEditingController descriptionCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
              Form(
                key: formKey,
                child: Column(
                  children: [
                    myField(
                        validationMode: AutovalidateMode.onUserInteraction,
                        hint: 'Enter Category Name',
                        fieldTitle: 'Category Name',
                        validator: (value) => categotyNameValidate(value),
                        controller: categoryNameCtrl),
                    SizedBox(height: 20),
                    myBigField(
                      validateMode: AutovalidateMode.onUserInteraction,
                      hint: 'Description',
                      fieldTitle: 'Description',
                      controller: descriptionCtrl,
                      validator: (value) => discription(value),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              addMenuBtn(
                btnText: 'Save Category',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    final newCategory = CatogoryModel(
                      name: categoryNameCtrl.text,
                      catogoryId:
                          DateTime.now().millisecondsSinceEpoch.toString(),
                      description: descriptionCtrl.text,
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
