import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:event_vault/widgets/date_and_time/date_select/date_theme.dart';
import 'package:flutter/material.dart';
import 'package:event_vault/database/functions/event/event.dart';
import 'package:event_vault/database/functions/catogory/catogory.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/database/modals/catogory_model/catogory_model.dart';
import 'package:event_vault/screen_function/event_manager/event_manager_fn.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/empty_list_handling/empty_list_handling.dart';
import 'package:event_vault/widgets/screen_event_manager/event_cards/event_card.dart';
import 'package:event_vault/widgets/screen_event_manager/screen_event_manager.dart';
import 'package:event_vault/widgets/text_field/text_field.dart';

class ScreenEventManager extends StatefulWidget {
  const ScreenEventManager({super.key});

  @override
  State<ScreenEventManager> createState() => _ScreenEventManagerState();
}

class _ScreenEventManagerState extends State<ScreenEventManager> {
  List<EventAddModal> result = [];
  List<CatogoryModel> categorys = [];
  final searchCtrl = TextEditingController();
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    getAllCategories();
    catogoryListener.addListener(handleCategoryUpdate);

    eventListen.addListener(() {
      applyFilters();
    });

    result = List.from(eventListen.value);
  }

  void handleCategoryUpdate() {
    if (mounted) {
      setState(() {
        categorys = catogoryListener.value;
      });
    }
  }

  void applyFilters() {
    List<EventAddModal> filteredList = List.from(eventListen.value);

    if (searchCtrl.text.isNotEmpty) {
      filteredList = searchEvent(
        search: searchCtrl.text,
        eventList: filteredList,
      );
    }

    if (selectedDate != null) {
      filteredList = filteredList.where((event) {
        final date = DateTime.parse(event.date);
        return date.year == selectedDate!.year &&
            date.month == selectedDate!.month &&
            date.day == selectedDate!.day;
      }).toList();
    }

    setState(() {
      result = filteredList;
    });
  }

  Future<void> selectDay() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(data: dateTheme(), child: child!);
      },
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
      applyFilters();
    }
  }

  void deleteEvent(EventAddModal event) {
    eventListen.value.remove(event);
    eventListen.notifyListeners();
    applyFilters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 26, 37, 1),
      appBar: CustomAppBar(title: "Event Manager"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchField(
              hint: 'Search events by name, date or location',
              controller: searchCtrl,
              onChanged: (value) {
                applyFilters();
              },
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Filters', style: myFont(size: 23)),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(height: 10),
                SearchChoiceChips(
                  events: eventListen.value,
                  category: categorys,
                  onSearchResult: (filteredEvents) {
                    setState(() {
                      result = filteredEvents;
                    });
                  },
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.secondary,
                            foregroundColor: AppTheme.textW,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: selectDay,
                        child: Text("Select Date"),
                      ),
                      if (selectedDate != null) ...[
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: 48,
                            width: 160,
                            decoration: BoxDecoration(),
                            child: Card(
                              color: AppTheme.secondary,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      extract(selectedDate!.toString()),
                                      style: myFont(size: 16),
                                    ),
                                    SizedBox(width: 1),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedDate = null;
                                          });
                                          applyFilters();
                                        },
                                        child: Icon(Icons.clear,
                                            color: Colors.red)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: eventListen,
                builder: (context, events, child) {
                  return result.isEmpty
                      ? emptyList(message: 'No Events Found')
                      : ListView.builder(
                          itemCount: result.length,
                          itemBuilder: (context, index) {
                            final event = result[index];
                            return EventCard(
                              event: event,
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
