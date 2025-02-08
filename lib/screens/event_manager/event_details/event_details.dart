import 'package:event_vault/database/functions/add_event/add_event.dart';
import 'package:event_vault/screen_function/event_manager/event_manager_fn.dart';
import 'package:event_vault/screens/event_edit_screen/event_edit/event_edit_screen.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:event_vault/widgets/event_detail_screen/event_detail_page.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatelessWidget {
  EventDetails({super.key, required this.image, required this.eventId});
  String image;
  String eventId;

  @override
  Widget build(BuildContext context) {
    final event = getEventById(eventId);
    if (event == null) {
      return Scaffold(
        appBar: CustomAppBar(title: 'Event Name'),
        body: Center(
          child: Text('Event not found'),
        ),
      );
    }
    final eventItems = event.items;

    return Scaffold(
      backgroundColor: AppTheme.mainBg,
      appBar: CustomAppBar(title: 'Event Name'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            ImageContainer(image: event.image),
            SizedBox(height: 20),
            Clientinfo(
              details: event.clientName,
              title: 'Client Name',
            ),
            SizedBox(height: 20),
            Clientinfo(
              details: event.contactInfo,
              title: 'Contact Information',
            ),
            SizedBox(height: 20),
            EventDescription(
              discriptionData: event.description,
            ),
            SizedBox(height: 20),
            EventDetailCards(
              eventDate: extract(event.date),
              eventLocation: event.location,
              eventTime: event.time,
            ),
            SpecialRequirements(specialReq: event.special),
            SizedBox(height: 20),
            EventItems(itemList: eventItems),
            SizedBox(height: 20),
            PageButtons(
              btnText: 'Expense Tracker',
              btnColor: AppTheme.secondary,
              onPressed: () {},
            ),
            SizedBox(height: 10),
            PageButtons(
              btnText: 'Manage Task',
              btnColor: AppTheme.secondary,
              onPressed: () {},
            ),
            SizedBox(height: 10),
            PageButtons(
              btnText: 'Edit',
              btnColor: AppTheme.hilite,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EventEditScreen(
                    event: event,
                  ),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
