import 'package:event_vault/database/modals/item_model/item_model.dart';
import 'package:event_vault/widgets/color%20palette/color_palette.dart';
import 'package:flutter/material.dart';

class ItemFilterChips extends StatelessWidget {
  final List<ItemModel> filteredItems;
  final List<ItemModel> selectedItems;
  final Function(String itemId) onItemSelected;

  const ItemFilterChips({
    super.key,
    required this.filteredItems,
    required this.selectedItems,
    required this.onItemSelected,
  });

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
