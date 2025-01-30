import 'package:event_vault/costum_widgets/add_menu_btn/add_menu_btn.dart';
import 'package:event_vault/costum_widgets/app_bar/app_bar.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/costum_widgets/custom_listenable_builder/filter_chip_builder/filter_chip_builder.dart';
import 'package:event_vault/costum_widgets/save_add_btn/save_add_btn.dart';
import 'package:event_vault/costum_widgets/text_field/text_field.dart';
import 'package:event_vault/costum_widgets/unique_id/unique_id.dart';
import 'package:event_vault/database/functions/add_event/add_event.dart';
import 'package:event_vault/database/functions/add_items/add_items.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/form_validation/event_adding/event_budget/event_budget.dart';
import 'package:event_vault/screens/add_event_screens/add_catogory_menu/add_new_item.dart';
import 'package:flutter/material.dart';
import '../../../database/modals/item_model/item_model.dart';

class AddCategoryMenu extends StatefulWidget {
  String categotyId;
  Map<String, dynamic> eventDetals;
  AddCategoryMenu(
      {super.key, required this.categotyId, required this.eventDetals});

  @override
  State<AddCategoryMenu> createState() => _AddCategoryMenuState();
}

class _AddCategoryMenuState extends State<AddCategoryMenu> {
  List<ItemModel> filteredItems = [];
  List<ItemModel> selectedItems = [];

  @override
  void initState() {
    super.initState();
    getItems();
    updateFilteredItems();
    itemListener.addListener(updateFilteredItems);
  }

  void updateFilteredItems() {
    setState(() {
      filteredItems = itemListener.value
          .where((item) => item.catogoryId == widget.categotyId)
          .toList();
    });
  }

  @override
  void dispose() {
    itemListener.removeListener(updateFilteredItems);
    super.dispose();
  }

  void getItemsByCategory(String categotyId) {
    updateFilteredItems();
  }

  void handleItemSelection(String itemId) {
    setState(() {
      final selectedItem =
          filteredItems.firstWhere((item) => item.itemId == itemId);

      if (selectedItems.any((item) => item.itemId == itemId)) {
        selectedItems.removeWhere((item) => item.itemId == itemId);
      } else {
        selectedItems.add(selectedItem);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final budgetCtrl = TextEditingController();
    final specialRequirementsCtrl = TextEditingController();
    final keyForm = GlobalKey<FormState>();

    budgetCtrl.text = widget.eventDetals['Budget'] ?? '0';

    return Scaffold(
      backgroundColor: ColorPalette.mainBg,
      appBar: CustomAppBar(title: 'Add Items Menu'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Form(
                key: keyForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myField(
                      keyboardType: TextInputType.number,
                      validationMode: AutovalidateMode.onUserInteraction,
                      hint: 'Enter Budget',
                      fieldTitle: 'Budget',
                      validator: (value) => eventBudgetValidation(value),
                      controller: budgetCtrl,
                    ),
                    const SizedBox(height: 20),
                    ItemFilterChips(
                      filteredItems: filteredItems,
                      selectedItems: selectedItems,
                      onItemSelected: handleItemSelection,
                    ),
                    const SizedBox(height: 20),
                    addMenuBtn(
                      btnText: 'Add Menu Item',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => AddNewItem(
                                    categoryId:
                                        widget.eventDetals['CategoryID'],
                                  )),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    myBigField(
                      validateMode: AutovalidateMode.disabled,
                      hint: 'Special Requirements',
                      fieldTitle: "Enter Custom Requests",
                      controller: specialRequirementsCtrl,
                      validator: (value) {},
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              saveCancelColumn(
                downBtn: 'Save',
                upBtn: 'Cancel',
                onDownBtn: () {
                  if (specialRequirementsCtrl.text.isEmpty) {
                    specialRequirementsCtrl.text = 'No Special Requirements';
                  }

                  if (selectedItems.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please select at least one item.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  if (keyForm.currentState!.validate()) {
                    final event = EventAddModal(
                      image: widget.eventDetals['Image'],
                      catogory: widget.categotyId,
                      eventName:
                          widget.eventDetals['EventName'] ?? 'No Event Name',
                      date: widget.eventDetals['Date'] ?? 'No Date',
                      time: widget.eventDetals['Time'] ?? 'No Time',
                      location: widget.eventDetals['Location'] ?? 'No Location',
                      description: widget.eventDetals['DescriptionCtrl'] ??
                          'No Description',
                      clientName:
                          widget.eventDetals['ClietName'] ?? 'No Client Name',
                      contactInfo: widget.eventDetals['ContactInfo'] ??
                          'No Contact Info',
                      eventId: generateID(),
                      items: selectedItems,
                      special: specialRequirementsCtrl.text,
                    );

                    addEvent(event);
                    Navigator.of(context).pop();
                  }
                },
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
}
