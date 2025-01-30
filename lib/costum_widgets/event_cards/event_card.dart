import 'dart:io';

import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/font/app_font.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  EventCard({
    super.key,
    required this.eventName,
    required this.eventDate,
    required this.eventTime,
    required this.category,
    required this.image,
  });

  String? image;
  String? eventName;
  String? eventDate;
  String? eventTime;
  String? category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      width: double.infinity,
      child: Material(
        color: Colors.transparent, // Set transparent material background
        child: InkWell(
          onTap: () {
            print("Tapped!");
          },
          splashColor: ColorPalette.hint,
          borderRadius: BorderRadius.circular(15), // Border radius for splash
          child: Card(
            elevation: 20,
            color: ColorPalette.secondary,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: FileImage(File(image!))),
                      color: ColorPalette.hint,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13),
                        topRight: Radius.circular(13),
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                    ),
                    // child: Center(
                    //   child: Text(
                    //     'Image',
                    //     style: myFont(size: 25),
                    //   ),
                    // ),
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
                        eventName!,
                        style: myFont(size: 20),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${eventDate!} ${eventTime!}',
                            style: myFont(size: 15),
                          ),
                          Text(
                            category!,
                            style: myFont(size: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
