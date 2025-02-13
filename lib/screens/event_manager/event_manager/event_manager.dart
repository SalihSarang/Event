import 'package:event_vault/database/functions/add_catogory/add_catogory.dart';
import 'package:event_vault/database/functions/add_event/add_event.dart';
import 'package:event_vault/database/modals/catogory_model/catogory_model.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/screen_function/event_manager/event_manager_fn.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/empty_list_handling/empty_list_handling.dart';
import 'package:event_vault/widgets/screen_event_manager/event_cards/event_card.dart';
import 'package:event_vault/widgets/screen_event_manager/screen_event_manager.dart';
import 'package:event_vault/widgets/text_field/text_field.dart';
import 'package:flutter/material.dart';

class ScreenEventManager extends StatefulWidget {
  const ScreenEventManager({super.key});

  @override
  State<ScreenEventManager> createState() => _ScreenEventManagerState();
}

class _ScreenEventManagerState extends State<ScreenEventManager> {
  List<String> dropDownList = [];
  var selectedTextFieldItem = 'All';
  final searchCtrl = TextEditingController();
  List<EventAddModal> result = [];
  List<CatogoryModel> categorys = [];

  @override
  void initState() {
    super.initState();
    getAllCategories();
    catogoryListener.addListener(handleCategoryUpdate);
    result = eventListen.value;
  }

  void handleCategoryUpdate() {
    if (mounted) {
      setState(() {
        categorys = catogoryListener.value;
      });
    }
  }

  updateUI(List<EventAddModal> newUI) {
    setState(() {
      result = newUI.isEmpty ? eventListen.value : newUI;
    });
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
                final searchResult = searchEvent(
                    search: searchCtrl.text, eventList: eventListen.value);
                setState(() {
                  result = searchResult;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Filters', style: myFont(size: 23)),
            ),
            SizedBox(
              height: 10,
            ),
            SearchChoiceChips(
              events: eventListen.value,
              category: categorys,
              onSearchResult: (filteredEvents) {
                setState(() => result = filteredEvents);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: eventListen,
                builder: (context, events, child) {
                  if (searchCtrl.text.isEmpty && result.isEmpty) {
                    result = events;
                  }

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
            )
          ],
        ),
      ),
    );
  }
}
