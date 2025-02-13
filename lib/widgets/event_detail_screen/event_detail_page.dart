import 'dart:io';
import 'package:event_vault/database/modals/item_model/item_model.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  ImageContainer({super.key, required this.image});
  String image;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: AppTheme.mainBg,
      child: Container(
        width: double.infinity,
        height: 320,
        decoration: BoxDecoration(
          color: AppTheme.secondary,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: FileImage(
              File(image),
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
// End Image Container

// Event Description

class EventDescription extends StatelessWidget {
  const EventDescription(
      {super.key,
      required this.discriptionData,
      this.maxLines,
      this.minLines,
      required this.title});
  final String discriptionData;
  final int? maxLines;
  final int? minLines;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: myFont(size: 20),
        ),
        SizedBox(height: 10),
        TextFormField(
          readOnly: true,
          maxLines: maxLines,
          minLines: minLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromRGBO(32, 34, 54, 1),
            hintText: discriptionData,
            hintStyle: const TextStyle(color: AppTheme.hint),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppTheme.hint,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppTheme.hint,
                width: 1,
              ),
            ),
          ),
        )
      ],
    );
  }
}
// End Event Description

// Event Date, time, location, Venue Cards

class EventDetailCards extends StatelessWidget {
  EventDetailCards(
      {super.key,
      required this.eventDate,
      required this.eventTime,
      required this.eventLocation});
  String eventTime;
  String eventDate;
  String eventLocation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Card(
                color: AppTheme.secondary,
                child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppTheme.hint),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: AppTheme.textW,
                          size: 35,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date',
                              style: myFont(size: 20),
                            ),
                            SizedBox(height: 3),
                            Text(
                              eventDate,
                              style: myFont(size: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: Card(
                color: AppTheme.secondary,
                child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppTheme.hint),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.access_time_outlined,
                          color: AppTheme.textW,
                          size: 35,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Time',
                              style: myFont(size: 20),
                            ),
                            SizedBox(height: 3),
                            Text(
                              eventTime,
                              style: myFont(size: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: Card(
                color: AppTheme.secondary,
                child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppTheme.hint),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_city,
                          color: AppTheme.textW,
                          size: 35,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Place',
                              style: myFont(size: 20),
                            ),
                            SizedBox(height: 3),
                            Text(
                              eventLocation,
                              style: myFont(size: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
//End Event Date, time, Locarion, Venue Cards

// Clientinfo
class Clientinfo extends StatelessWidget {
  Clientinfo({super.key, required this.details, required this.title});
  String details;
  String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: myFont(size: 20),
        ),
        SizedBox(height: 10),
        TextFormField(
          readOnly: true,
          maxLines: 1,
          minLines: 1,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromRGBO(32, 34, 54, 1),
            hintText: details,
            hintStyle: const TextStyle(color: AppTheme.hint),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppTheme.hint,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppTheme.hint,
                width: 1,
              ),
            ),
          ),
        )
      ],
    );
  }
}
// End Clientinfo

// Special Requirements
class SpecialRequirements extends StatelessWidget {
  SpecialRequirements({super.key, required this.specialReq});
  String specialReq;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Special Requirements',
          style: myFont(size: 20),
        ),
        SizedBox(height: 10),
        TextFormField(
          readOnly: true,
          maxLines: 5,
          minLines: 1,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromRGBO(32, 34, 54, 1),
            hintText: specialReq,
            hintStyle: const TextStyle(color: AppTheme.hint),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppTheme.hint,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppTheme.hint,
                width: 1,
              ),
            ),
          ),
        )
      ],
    );
  }
}
// End Special Requirements

// Event Items
class EventItems extends StatelessWidget {
  EventItems({super.key, required this.itemList});

  List<ItemModel> itemList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Items',
          style: myFont(size: 25),
        ),
        SizedBox(
          height: 400,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              final item = itemList[index];
              return Card(
                color: AppTheme.secondary,
                child: ListTile(
                  title: Text(
                    item.itemName,
                    style: myFont(),
                  ),
                  subtitle: Text(
                    'Price : ${item.itemPrice}',
                    style: myFont(),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
// Event Items

// Event Details Page Buttons
class PageButtons extends StatelessWidget {
  PageButtons(
      {super.key,
      required this.btnText,
      required this.btnColor,
      required this.onPressed});
  String btnText;
  Color btnColor;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth * 0.4,
      height: screenHeight * 0.06,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(width: 0),
          ),
          backgroundColor: btnColor,
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(btnText, style: myFont(size: 25)),
        ),
      ),
    );
  }
}
