import 'package:event_vault/database/functions/event/event.dart';
import 'package:event_vault/database/functions/items/items.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/notification_fn/event_remainder.dart';
import 'package:event_vault/screen_function/event_manager/event_manager_fn.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/utils/validation/event_adding/event_budget/event_budget.dart';
import 'package:event_vault/screens/add_event_screens/add_catogory_menu/add_new_item.dart';
import 'package:event_vault/widgets/buttons/add_menu_btn/add_menu_btn.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:event_vault/widgets/custom_listenable_builder/filter_chip_builder/filter_chip_builder.dart';
import 'package:event_vault/widgets/buttons/save_add_btn/save_add_btn.dart';
import 'package:event_vault/widgets/text_field/text_field.dart';
import 'package:event_vault/widgets/unique_id/unique_id.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  ValueNotifier<List<ItemModel>> selectedItems =
      ValueNotifier<List<ItemModel>>([]);

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

      if (selectedItems.value.any((item) => item.itemId == itemId)) {
        selectedItems.value.removeWhere((item) => item.itemId == itemId);
      } else {
        selectedItems.value.add(selectedItem);
      }
    });
  }

  getSelectedItem() {
    final eventId = widget.eventDetals['EventID'];
  }

  @override
  Widget build(BuildContext context) {
    final budgetCtrl = TextEditingController();
    final specialRequirementsCtrl = TextEditingController();
    final keyForm = GlobalKey<FormState>();

    budgetCtrl.text = widget.eventDetals['Budget'] ?? '0';

    return Scaffold(
      backgroundColor: AppTheme.mainBg,
      appBar: CustomAppBar(title: 'Add Items Menu'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            saveCancelColumn(
              downBtn: 'Save',
              upBtn: 'Cancel',
              onDownBtn: () {
                if (specialRequirementsCtrl.text.isEmpty) {
                  specialRequirementsCtrl.text = 'No Special Requirements';
                }

                if (selectedItems.value.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please select at least one item.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                if (keyForm.currentState!.validate()) {
                  final dateStr = widget.eventDetals['Date'];
                  final date = DateFormat('dd/MMM/yyyy').parse(dateStr);
                  final time = widget.eventDetals['Time'];
                  final eventDateTime =
                      combineDateAndTime(date.toString(), time);
                  final event = EventAddModal(
                    categoryName: widget.eventDetals['CategoryName'],
                    budget: budgetCtrl.text,
                    image: widget.eventDetals['Image'],
                    catogory: widget.categotyId,
                    eventName:
                        widget.eventDetals['EventName'] ?? 'No Event Name',
                    date: date.toString(),
                    time: time,
                    location: widget.eventDetals['Location'] ?? 'No Location',
                    description: widget.eventDetals['DescriptionCtrl'] ??
                        'No Description',
                    clientName:
                        widget.eventDetals['ClietName'] ?? 'No Client Name',
                    contactInfo:
                        widget.eventDetals['ContactInfo'] ?? 'No Contact Info',
                    eventId: generateID(),
                    items: selectedItems.value,
                    special: specialRequirementsCtrl.text,
                  );

                  addEvent(event);
                  NotificationService.scheduleEventNotifications(eventDateTime);
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
                      selectedItems: selectedItems.value,
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
                      validator: (value) {
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              ValueListenableBuilder(
                valueListenable: selectedItems,
                builder: (context, items, child) {
                  if (items.isEmpty) {
                    return Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Selected Items', style: myFont(size: 25)),
                        Text(
                          'Item Not Selected',
                          style: hintFont(),
                        ),
                      ],
                    ));
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Selected Items', style: myFont(size: 25)),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final item = items[index];
                              return Card(
                                color: AppTheme.secondary,
                                child: ListTile(
                                  title: Text(item.itemName,
                                      style: myFont(size: 25)),
                                  subtitle: Text('Price : ${item.itemPrice}',
                                      style: myFont(size: 18)),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),

              // saveCancelColumn(
              //   downBtn: 'Save',
              //   upBtn: 'Cancel',
              //   onDownBtn: () {
              //     if (specialRequirementsCtrl.text.isEmpty) {
              //       specialRequirementsCtrl.text = 'No Special Requirements';
              //     }

              //     if (selectedItems.isEmpty) {
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         SnackBar(
              //           content: Text('Please select at least one item.'),
              //           backgroundColor: Colors.red,
              //         ),
              //       );
              //       return;
              //     }

              //     if (keyForm.currentState!.validate()) {
              //       final event = EventAddModal(
              //         categoryName: widget.eventDetals['CategoryName'],
              //         budget: budgetCtrl.text,
              //         image: widget.eventDetals['Image'],
              //         catogory: widget.categotyId,
              //         eventName:
              //             widget.eventDetals['EventName'] ?? 'No Event Name',
              //         date: widget.eventDetals['Date'] ?? 'No Date',
              //         time: widget.eventDetals['Time'] ?? 'No Time',
              //         location: widget.eventDetals['Location'] ?? 'No Location',
              //         description: widget.eventDetals['DescriptionCtrl'] ??
              //             'No Description',
              //         clientName:
              //             widget.eventDetals['ClietName'] ?? 'No Client Name',
              //         contactInfo: widget.eventDetals['ContactInfo'] ??
              //             'No Contact Info',
              //         eventId: generateID(),
              //         items: selectedItems,
              //         special: specialRequirementsCtrl.text,
              //       );

              //       addEvent(event);
              //       Navigator.of(context).pop();
              //       Navigator.of(context).pop();
              //     }
              //   },
              //   onUpBtn: () {
              //     Navigator.pop(context);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
