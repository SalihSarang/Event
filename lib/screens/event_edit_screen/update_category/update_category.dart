import 'package:event_vault/database/functions/add_event/add_event.dart';
import 'package:event_vault/database/functions/add_items/add_items.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/utils/validation/event_adding/event_budget/event_budget.dart';
import 'package:event_vault/screens/event_edit_screen/edit_category_item/edit_item.dart';
import 'package:event_vault/widgets/buttons/add_menu_btn/add_menu_btn.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:event_vault/widgets/custom_listenable_builder/filter_chip_builder/filter_chip_builder.dart';
import 'package:event_vault/widgets/buttons/save_add_btn/save_add_btn.dart';
import 'package:event_vault/widgets/text_field/text_field.dart';
import 'package:flutter/material.dart';
import '../../../database/modals/item_model/item_model.dart';

class UpdateCategory extends StatefulWidget {
  String categotyId;
  Map<String, dynamic> eventDetals;
  UpdateCategory(
      {super.key, required this.categotyId, required this.eventDetals});

  @override
  State<UpdateCategory> createState() => _UpdateCategory();
}

class _UpdateCategory extends State<UpdateCategory> {
  List<ItemModel> filteredItems = [];
  List<ItemModel> selectedItems = [];

  void loadSelectedItems() async {
    final eventId = widget.eventDetals['EventID'];
    final items = await getSelectedItems(eventId);

    setState(() {
      selectedItems = items;
    });
  }

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
    widget.eventDetals;
    final budgetCtrl = TextEditingController();
    final specialRequirementsCtrl = TextEditingController();
    final keyForm = GlobalKey<FormState>();

    budgetCtrl.text = widget.eventDetals['Budget'] ?? '0';
    specialRequirementsCtrl.text = widget.eventDetals['Description'];

    return Scaffold(
      backgroundColor: AppTheme.mainBg,
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
                              builder: (context) => EditItem(
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
                      categoryName: widget.eventDetals['Image'],
                      budget: budgetCtrl.text,
                      image: widget.eventDetals['Image'],
                      catogory: widget.categotyId,
                      eventName: widget.eventDetals['EventName'],
                      date: widget.eventDetals['Date'],
                      time: widget.eventDetals['Time'],
                      location: widget.eventDetals['Location'],
                      description: widget.eventDetals['DescriptionCtrl'],
                      clientName: widget.eventDetals['ClietName'],
                      contactInfo: widget.eventDetals['ContactInfo'],
                      eventId: widget.eventDetals['EventID'],
                      items: selectedItems,
                      special: specialRequirementsCtrl.text,
                    );

                    upDateEvent(event);
                    Navigator.of(context).pop();
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
