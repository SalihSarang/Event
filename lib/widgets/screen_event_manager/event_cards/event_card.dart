import 'dart:io';
import 'package:event_vault/database/functions/add_event/add_event.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/screens/event_edit_screen/event_edit/event_edit_screen.dart';
import 'package:event_vault/screens/event_manager/event_details/event_details.dart';
import 'package:event_vault/widgets/alert_box/alert_box.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class EventCard extends StatelessWidget {
  EventCard({super.key, required this.event});
  String? detailPageImg;

  EventAddModal event;

  @override
  Widget build(BuildContext context) {
    final date = event.date;
    developer.log("Image path: ${event.categoryName}");
    return SizedBox(
      height: 320,
      width: double.infinity,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            developer.log("Tapped!");
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EventDetails(
                image: detailPageImg!,
                eventId: event.eventId,
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
                            'Date : $date',
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
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EventEditScreen(
                                      event: event,
                                    ),
                                  )),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: AppTheme.hilite,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Delete',
                                    style: myFont(),
                                  )
                                ],
                              )),
                          PopupMenuItem(
                              onTap: () {
                                customAlertBox(context,
                                    title: "You Want To Delete This Event",
                                    message: "You Want To Delete This Event",
                                    icon: Icons.delete, noPressed: () {
                                  Navigator.pop(context);
                                }, yesPressed: () {
                                  deleteEvent(event.eventId);
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: AppTheme.delete,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Delete',
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

  ImageProvider _getImageProvider(String imagePath) {
    if (imagePath.isNotEmpty && File(imagePath).existsSync()) {
      detailPageImg = imagePath;
      return FileImage(File(imagePath));
    } else {
      detailPageImg = "lib/assets/download (48).jpg";
      return const AssetImage("lib/assets/download (48).jpg");
    }
  }
}
