import 'package:event_vault/database/functions/catogory/catogory.dart';
import 'package:event_vault/utils/validation/category_details/category_name/category_name.dart';
import 'package:event_vault/utils/validation/event_adding/event_discription/event_discription.dart';
import 'package:event_vault/widgets/buttons/add_menu_btn/add_menu_btn.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:event_vault/widgets/text_field/text_field.dart';
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
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    categoryNameCtrl.text = widget.catecoryName;
    descriptionCtrl.text = widget.discription;

    return Scaffold(
      backgroundColor: AppTheme.mainBg,
      appBar: CustomAppBar(title: 'Edit Category'),
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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
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
