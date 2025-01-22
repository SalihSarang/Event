import 'package:event_vault/costum_widgets/add_menu_btn.dart';
import 'package:event_vault/costum_widgets/text_field.dart';
import 'package:event_vault/database/functions/add_catogory/add_catogory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCategoryItems extends StatefulWidget {
  const AddCategoryItems({super.key});

  @override
  State<AddCategoryItems> createState() => _AddCategoryItemsState();
}

class _AddCategoryItemsState extends State<AddCategoryItems> {
  final itemName = TextEditingController();
  final price = TextEditingController();
  String? categorySelect;
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              ValueListenableBuilder(
                valueListenable: catogoryListener,
                builder: (context, categories, child) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(32, 34, 54, 1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white70,
                        width: 1,
                      ),
                    ),
                    child: DropdownButton<String>(
                      underline: SizedBox(),
                      dropdownColor: const Color.fromRGBO(25, 26, 37, 1),
                      isExpanded: true,
                      items: categories.map<DropdownMenuItem<String>>((item) {
                        return DropdownMenuItem<String>(
                          value: item.name,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              item.name,
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      value: categorySelect,
                      hint: Text(
                        'Select Category',
                        style: GoogleFonts.roboto(color: Colors.white70),
                      ),
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.white),
                      onChanged: (selectedValue) {
                        setState(() {
                          categorySelect = selectedValue;
                        });
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              myField(
                  hint: 'Enter Item Name',
                  fieldTitle: 'Item Name',
                  validator: (p0) {},
                  controller: itemName),
              const SizedBox(height: 20),
              myField(
                  hint: 'Enter Price',
                  fieldTitle: 'Price',
                  validator: (p0) {},
                  controller: price),
              const SizedBox(height: 20),
              addMenuBtn(
                btnText: 'Add Item',
                onPressed: () {
                  print("Selected category: ${categorySelect}");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
