import 'dart:io';
import 'package:event_vault/database/functions/add_completed/add_completed.dart';
import 'package:event_vault/database/functions/add_event/add_event.dart';
import 'package:event_vault/database/modals/completed_events_model/completed.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/screen_function/event_manager/event_manager_fn.dart';
import 'package:event_vault/screens/event_edit_screen/event_edit/event_edit_screen.dart';
import 'package:event_vault/screens/event_manager/event_details/event_details.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/alert_box/alert_box.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:event_vault/widgets/event_detail_screen/event_detail_page.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class EventHistoryCard extends StatelessWidget {
  EventHistoryCard(
      {super.key,
      required this.event,
      required this.completedEvent,
      required this.detailPageImg});

  String detailPageImg;
  Completed completedEvent;
  EventAddModal event;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      width: double.infinity,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            developer.log("Tapped!");
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HistoryEventDetails(
                event: event,
                image: detailPageImg,
              ),
            ));
          },
          splashColor: AppTheme.hint,
          borderRadius: BorderRadius.circular(15),
          child: Card(
            elevation: 20,
            color: AppTheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: _getImageProvider(event.image),
                        fit: BoxFit.cover,
                      ),
                      color: AppTheme.hint,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(13),
                        topRight: Radius.circular(13),
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      title: Text(
                        'Titile : ${event.eventName}',
                        style: myFont(size: 20),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date : ${extract(event.date)}',
                            style: myFont(size: 15),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            'Time : ${event.time}',
                            style: myFont(size: 15),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      trailing: PopupMenuButton(
                        iconColor: AppTheme.textW,
                        color: const Color.fromARGB(255, 55, 58, 92),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                              onTap: () {
                                customAlertBox(context,
                                    title: "You Want To Delete This Event",
                                    message: "You Want To Delete This Event",
                                    icon: Icons.delete, noPressed: () {
                                  Navigator.pop(context);
                                }, yesPressed: () {
                                  final restoredEvent = EventAddModal(
                                      budget: event.budget,
                                      categoryName: event.categoryName,
                                      catogory: event.catogory,
                                      clientName: event.clientName,
                                      contactInfo: event.contactInfo,
                                      date: event.date,
                                      description: event.description,
                                      eventId: event.eventId,
                                      eventName: event.eventName,
                                      image: event.image,
                                      items: event.items,
                                      location: event.location,
                                      special: event.special,
                                      time: event.time);
                                  addEvent(restoredEvent);
                                  restoreEvent(completedEvent.completedID);
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.restore_sharp,
                                    color: AppTheme.textW,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Restore',
                                    style: myFont(),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ImageProvider _getImageProvider(String? imagePath) {
    if (imagePath != null &&
        imagePath.isNotEmpty &&
        File(imagePath).existsSync()) {
      detailPageImg = imagePath;
      return FileImage(File(imagePath));
    } else {
      detailPageImg = "lib/assets/download (48).jpg";
      return const AssetImage("lib/assets/download (48).jpg");
    }
  }
}

class HistoryEventDetails extends StatelessWidget {
  HistoryEventDetails({super.key, required this.image, required this.event});
  String image;
  // String eventId;
  EventAddModal event;

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
  }
}
