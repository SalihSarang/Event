import 'package:event_vault/database/functions/add_catogory/add_catogory.dart';
import 'package:event_vault/database/functions/add_event/add_event.dart';
import 'package:event_vault/database/modals/catogory_model/catogory_model.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/choice_chips/choice_chips.dart';
import 'package:event_vault/widgets/event_cards/event_card.dart';
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
    catogoryListener.addListener(() {
      setState(() {
        categorys = catogoryListener.value;
      });
    });
    result = eventListen.value;
  }

  searchEvent() {
    List<EventAddModal> searchedEvents = [];
    if (searchCtrl.text.isNotEmpty) {
      searchedEvents = result.where((event) {
        final eventName =
            event.eventName.toLowerCase().contains(searchCtrl.text);
        final eventDate = event.date.toLowerCase().contains(searchCtrl.text);
        final eventCategory =
            event.catogory.toLowerCase().contains(searchCtrl.text);
        final eventLocation =
            event.location.toLowerCase().contains(searchCtrl.text);
        return eventName || eventDate || eventCategory || eventLocation;
      }).toList();
    } else {
      searchedEvents = eventListen.value;
    }
    setState(() {
      result = searchedEvents;
    });
  }

  updateUI(List<EventAddModal> newUI) {
    setState(() {
      if (newUI.isEmpty) {
        result = eventListen.value;
      } else {
        result = newUI;
      }
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
                searchEvent();
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
              child: ValueListenableBuilder<List<EventAddModal>>(
                valueListenable: eventListen,
                builder: (context, events, child) {
                  if (searchCtrl.text.isEmpty && result.isEmpty) {
                    result = events;
                  }

                  return ListView.builder(
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
