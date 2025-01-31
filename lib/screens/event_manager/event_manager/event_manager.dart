import 'package:event_vault/costum_widgets/app_bar/app_bar.dart';
import 'package:event_vault/costum_widgets/catogory_dropdown/catogory_dropdown.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/costum_widgets/event_cards/event_card.dart';
import 'package:event_vault/costum_widgets/text_field/text_field.dart';
import 'package:event_vault/database/functions/add_event/add_event.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenEventManager extends StatefulWidget {
  const ScreenEventManager({super.key});

  @override
  State<ScreenEventManager> createState() => _ScreenEventManagerState();
}

class _ScreenEventManagerState extends State<ScreenEventManager> {
  List<String> dropDownList = [];
  var selectedTextFieldItem = 'All';
  final searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 26, 37, 1),
      appBar: CustomAppBar(title: "Event Manager"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            searchField(
                hint: 'Search events by name, date or location',
                controller: searchCtrl),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Filters',
                style: GoogleFonts.roboto(
                  color: ColorPalette.textW,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            dropDown(
              dropDownList: dropDownList,
              selectedTextFieldItem: selectedTextFieldItem,
              onChanged: (String? newValue) {
                setState(() {
                  selectedTextFieldItem = newValue!;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: ValueListenableBuilder<List<EventAddModal>>(
                valueListenable: eventListen,
                builder: (context, events, child) {
                  return ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index];
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
