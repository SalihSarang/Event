import 'package:event_vault/database/functions/add_catogory/add_catogory.dart';
import 'package:event_vault/database/functions/add_event/add_event.dart';
import 'package:event_vault/database/modals/catogory_model/catogory_model.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/screen_function/event_manager/event_manager_fn.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class SearchChoiceChips extends StatefulWidget {
  final List<CatogoryModel> category;
  final List<EventAddModal> events;
  final Function(List<EventAddModal>) onSearchResult;

  const SearchChoiceChips({
    super.key,
    required this.category,
    required this.events,
    required this.onSearchResult,
  });

  @override
  State<SearchChoiceChips> createState() => _SearchChoiceChipsState();
}

class _SearchChoiceChipsState extends State<SearchChoiceChips> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: catogoryListener,
      builder: (context, List<CatogoryModel> categories, child) {
        return Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: List.generate(
            categories.length + 1,
            (index) {
              if (index == 0) {
                return ChoiceChip(
                  label: Text(
                    'All',
                    style: TextStyle(
                      color: selectedIndex == index
                          ? Colors.white
                          : AppTheme.textW,
                    ),
                  ),
                  side: BorderSide.none,
                  selected: selectedIndex == index,
                  selectedColor: AppTheme.hilite,
                  backgroundColor: AppTheme.secondary,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedIndex = selected ? index : -1;
                    });
                    widget.onSearchResult(eventListen.value);
                  },
                );
              }

              final categoryIndex = index - 1;
              return ChoiceChip(
                label: Text(
                  categories[categoryIndex].name,
                  style: TextStyle(
                    color:
                        selectedIndex == index ? Colors.white : AppTheme.textW,
                  ),
                ),
                side: BorderSide.none,
                selected: selectedIndex == index,
                selectedColor: AppTheme.hilite,
                backgroundColor: AppTheme.secondary,
                onSelected: (bool selected) {
                  setState(() {
                    selectedIndex = selected ? index : 0;
                  });
                  if (selected) {
                    final selectedCategory = categories[categoryIndex];
                    final filteredEvents = filterSearchEvent(
                      result: widget.events,
                      search: selectedCategory.name,
                    );

                    widget.onSearchResult(filteredEvents);
                    print(filteredEvents);
                  } else {
                    widget.onSearchResult(widget.events);
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
