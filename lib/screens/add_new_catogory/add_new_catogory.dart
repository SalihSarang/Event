import 'package:event_vault/costum_widgets/add_menu_btn.dart';
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
  final TextEditingController categoryNameController = TextEditingController();
  final List<TextEditingController> itemControllers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 26, 37, 1),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Add New Category',
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
              TextField(
                controller: categoryNameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Category Name',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              addMenuBtn(
                btnText: 'Save Category',
                onPressed: () async {
                  final categoryName = categoryNameController.text;
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
