import 'package:event_vault/costum_widgets/add_menu_btn/add_menu_btn.dart';
import 'package:event_vault/costum_widgets/app_bar/app_bar.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/costum_widgets/save_add_btn/save_add_btn.dart';
import 'package:event_vault/costum_widgets/text_field/text_field.dart';
import 'package:event_vault/costum_widgets/unique_id/unique_id.dart';
import 'package:event_vault/database/functions/add_items/add_items.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/database/modals/item_model/item_model.dart';
import 'package:event_vault/screens/add_event_screens/add_catogory_menu/add_catogory_menu.dart';
import 'package:event_vault/screens/add_event_screens/add_catogory_menu/add_new_item.dart';
import 'package:flutter/material.dart';

class ItemFilterChips extends StatelessWidget {
  final List<ItemModel> filteredItems;
  final List<ItemModel> selectedItems;
  final Function(String itemId) onItemSelected;

  const ItemFilterChips({
    Key? key,
    required this.filteredItems,
    required this.selectedItems,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: filteredItems.map((item) {
        return FilterChip(
          label: Text(
            item.itemName,
            style: TextStyle(color: ColorPalette.textW),
          ),
          selected: selectedItems
              .any((selectedItem) => selectedItem.itemId == item.itemId),
          onSelected: (isSelected) {
            onItemSelected(item.itemId);
          },
          selectedColor: ColorPalette.hilite,
          backgroundColor: ColorPalette.secondary,
          checkmarkColor: Colors.white,
        );
      }).toList(),
    );
  }
}

class _AddCategoryMenuState extends State<AddCategoryMenu> {
  List<ItemModel> filteredItems = [];
  List<ItemModel> selectedItems = [];

  @override
  void initState() {
    super.initState();
    getItemsByCategory(widget.categotyId);
  }

  void getItemsByCategory(String categotyId) {
    final allItems = itemListener.value;
    setState(() {
      filteredItems =
          allItems.where((item) => item.catogoryId == categotyId).toList();
    });
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

    budgetCtrl.text = widget.eventDetals['Budget'];

    return Scaffold(
      backgroundColor: ColorPalette.mainBg,
      appBar: CustomAppBar(title: 'Add Items Menu'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              myField(
                validationMode: AutovalidateMode.onUserInteraction,
                hint: 'Enter Budget',
                fieldTitle: 'Budget',
                validator: (p0) => null,
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
                            categoryId: widget.eventDetals['CategoryID'])),
                  );
                },
              ),
              const SizedBox(height: 20),
              myBigField(
                hint: 'Special Requirements',
                fieldTitle: "Enter Custom Requests",
                controller: specialRequirementsCtrl,
                validator: (p0) {},
              ),
              const SizedBox(height: 20),
              saveCancelColumn(
                downBtn: 'Save',
                upBtn: 'Cancel',
                onDownBtn: () {
                  // print("Selected Items: ${selectedItems[0]}");
                  EventAddModal(
                      catogory: widget.eventDetals['CategoryName'],
                      eventName: widget.eventDetals['EventName'],
                      date: widget.eventDetals['Date'],
                      time: widget.eventDetals['Time'],
                      location: widget.eventDetals['Location'],
                      description: widget.eventDetals['DescriptionCtrl'],
                      clientName: widget.eventDetals['ClietName'],
                      contactInfo: widget.eventDetals['ContactInfo'],
                      eventId: generateID(),
                      items: selectedItems);
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
